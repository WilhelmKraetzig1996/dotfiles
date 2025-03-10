vim.keymap.set('n', 'db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { desc = '[D]ebug [B]reakpoint' })
vim.keymap.set('n', 'dc', '<cmd>lua require"dap".continue()<CR>', { desc = '[D]ebug [C]ontinue' })
vim.keymap.set('n', 'do', '<cmd>lua require"dap".step_over()<CR>', { desc = '[D]ebug Step [O]ver' })
vim.keymap.set('n', 'di', '<cmd>lua require"dap".step_into()<CR>', { desc = '[D]ebug Step [I]nto' })
vim.keymap.set('n', 'dk', '<cmd>lua require"dap".up()<CR>', { desc = '[D]ebug Step up Stack' })
vim.keymap.set('n', 'dj', '<cmd>lua require"dap".down()<CR>', { desc = '[D]ebug Step up Stack' })
vim.keymap.set('n', 'dtt', '<cmd>lua require"dap-python".test_method()<CR>', { desc = '[D]ebug [T]est' })
vim.keymap.set('n', 'du', '<cmd>lua require("dapui").toggle()<CR>', { desc = '[D]ebug [T]est' })

local dap = require('dap')

vim.fn.sign_define('DapBreakpoint', { text='●', texthl='LspDiagnosticsDefaultError' })
vim.fn.sign_define('DapLogPoint' , { text='◉', texthl='LspDiagnosticsDefaultError' })
vim.fn.sign_define('DapStopped' , { text='➔', texthl='LspDiagnosticsDefaultInformation',
                                    linehl='CursorLine' })

-- Python
require('dap-python').setup('python')

local ui  = require 'dapui'
-- dap.listeners.after['event_initialized']['dapui_config'] = function()
-- 	ui.open({})
-- end
-- dap.listeners.before['event_terminated']['dapui_config'] = function()
-- 	ui.close({})
-- end

-- dap.listeners.before['event_exited']['dapui_config'] = function()
-- 	ui.close({})
-- end

local vt  = require 'nvim-dap-virtual-text'
vt.setup {}

ui.setup {
	mappings = {
		expand = {'<CR>', '<LeftMouse>'},
		open = {'o'},
		remove = {'d', 'x'},
		edit = {'c'},
		repl = {'r'},
	},
	layouts = {
		{
			elements = {
				'breakpoints',
				'watches',
				'stacks',
				'scopes',
			},
			size = 40,
			position = 'right',
		}, {
			elements = {
                'repl', 
                'console'},
			size = 10,
			position = 'bottom',
		},
	},
	floating = {
		max_height = nil,  -- Either absolute integer or float
		max_width  = nil,  -- between 0 and 1 (size relative to screen size)
	},
}

local function dapui_eval()
	local expr = vim.fn.input('DAP expression: ')
	if vim.fn.empty(expr) ~= 0 then
		return
	end
	ui.eval(expr, {})
end

vim.keymap.set({'n', 'v'}, '<M-i>', ui.eval, {})
vim.keymap.set('n', '<M-I>', dapui_eval, {})


-- CPP
local dap = require('dap')
if vim.loop.os_uname().sysname == "Linux" then
    dir_sep  = '/'
    adapter = 'cppdbg'
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/home/dear/.var/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7',
    }
elseif vim.loop.os_uname().sysname == "Darwin" then
    dir_sep  = '/'
    adapter = 'codelldb'
    local dap = require('dap')
    dap.adapters.codelldb = {
      type = 'server',
      host = '127.0.0.1',
      port = "${port}",
      executable = {
        command = '/Users/wilhelm/codelldb/extension/adapter/codelldb',
        args = {"--port", "${port}"},
      }
    }
else
    dir_sep  = '\\'
    adapter = 'codelldb'
    dap.adapters.codelldb = {
      type = 'server',
      host = '127.0.0.1',
      port = "${port}",
      executable = {
        command = 'C:\\Users\\Wilhelm\\codellb\\extension\\adapter\\codelldb.exe',
        args = {"--port", "${port}"},
        detached = false,
      }
    }
end
local cppdbg = {
  {
    name = "Launch file",
    type = adapter,
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', '', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,

  }
}
dap.configurations.cpp = cppdbg
dap.configurations.c = cppdbg
dap.set_exception_breakpoints({
    {"cpp_throw", true},
    {"cpp_catch", true},
    {"cpp_abort", true},
    {"cpp_assert", true}
})

table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Run in current dir',
  program = '${file}',  
  cwd = vim.fn.getcwd(),
  console = 'internalConsole',
  args = function()
        local args_string = vim.fn.input('Arguments: ')
        return vim.split(args_string, " +")
      end;
})
