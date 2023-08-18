local api = vim.api

local my_lines = {}
vim.b.my_lines = my_lines
local ns_id = api.nvim_create_namespace('sep')
-- ok
-- ok
local function build_line()
  local line_text = ""
  -- TODO: also defined by user
  local line_width = vim.api.nvim_win_get_width(0)

  -- ━
  -- ─
  for _ = 1, line_width do line_text = line_text .. "─" end
  return line_text
end

local function is_line_empty(line_number)
  local line_content = api.nvim_buf_get_lines(0, line_number, line_number + 1, true)
  for _, c in ipairs(line_content) do
    if c ~= "" then return false end
  end

  return true
end

local function find_next_blank_row_upward(current_row)
  for row = current_row, 1, -1 do
    if is_line_empty(row) then
      return row
    end
  end

  return -1
end

local function update_line()
  local col_num = 0

  local line_text = build_line()

  local opts = {
    virt_text = { { line_text, 'Conceal' } },
    virt_text_pos = 'overlay',
    right_gravity = true,
  }

  local ts = vim.treesitter
  local query = ts.query.parse("lua", [[ (function_declaration) @x ]])
  local parser = ts.get_parser(0, "lua")
  local root = parser:parse()[1]:root()
  local start_row, _, end_row, _ = root:range()

  for _, node in query:iter_captures(root, 0, start_row, end_row) do
    local range = ts.get_node_range(node)
    if is_line_empty(range - 1) then
      local id = api.nvim_buf_set_extmark(0, ns_id, range - 1, col_num, opts)
      -- ???: which is cheaper:
      -- a string indexed table 
      -- or a zero-initialized integer indexed table (table = {0; max_row_number})
      my_lines[tostring(range - 1)] = id
      vim.b.my_lines = my_lines
    else
      local new_row = find_next_blank_row_upward(range - 2)
      if new_row ~= -1 then
        local id = api.nvim_buf_set_extmark(0, ns_id, new_row, col_num, opts)
        my_lines[tostring(new_row)] = id
        vim.b.my_lines = my_lines
      end
    end
  end
end


api.nvim_create_augroup("sep", {
  clear = false
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = "sep",
  callback = function(ev)
    local current_row = vim.api.nvim_win_get_cursor(0)[1]
    local extmark_id = vim.b.my_lines[tostring(current_row)]
    print(vim.inspect(extmark_id))
    print(vim.inspect(vim.b.my_lines))
    if extmark_id ~= nil then
      vim.api.nvim_buf_del_extmark(0, ns_id, extmark_id)
    end
  end
})

-- XXX: CursorHold
vim.api.nvim_create_autocmd("InsertLeave", {
  group = "sep",
  callback = function(ev)
    update_line()
  end
})

