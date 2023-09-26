vim.keymap.set('n', 'db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { desc = '[D]ebug [B]reakpoint' })
vim.keymap.set('n', 'dc', '<cmd>lua require"dap".continue()<CR>', { desc = '[D]ebug [C]ontinue' })
vim.keymap.set('n', 'do', '<cmd>lua require"dap".step_over()<CR>', { desc = '[D]ebug Step [O]ver' })
vim.keymap.set('n', 'di', '<cmd>lua require"dap".step_into()<CR>', { desc = '[D]ebug Step [I]nto' })
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

vim.keymap.set({'n', 'v'}, '<M-k>', ui.eval, {})
vim.keymap.set('n', '<M-K>', dapui_eval, {})


-- CPP
require("dap").adapters.lldb = {
	type = "executable",
	command = "/usr/local/opt/llvm/bin/lldb-vscode",
	name = "lldb",
}

local lldb = {
	name = "Launch lldb",
	type = "lldb",
	request = "launch", -- could also attach to a currently running process
	program = function()
		return vim.fn.input(
			"Path to executable: ",
			vim.fn.getcwd() .. "/",
			"file"
		)
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = true,
	args = {},
	runInTerminal = false,
}

dap.configurations.rust = { lldb }
dap.configurations.cpp = { lldb }

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
