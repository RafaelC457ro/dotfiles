local status, cmake = pcall(require, "cmake-tools")
if (not status) then return end

cmake.setup {
  cmake_build_directory = "build",
  cmake_dap_configuration = { name = "cpp", type = "lldb", request = "launch" }, -- dap configuration, optional
  cmake_dap_open_command = require("dap").repl.open, -- optional
}

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "cr", "<cmd>CMakeRun<CR>", opts)
keymap.set("n", "cb", "<cmd>CMakeBuild<CR>", opts)
keymap.set("n", "cf", "<cmd>CMakeGenerate<CR>", opts)
keymap.set("n", "ct", "<cmd>CMakeSelectLaunchTarget<CR>", opts)
keymap.set("n", "cd", "<cmd>CMakeDebug<CR>", opts)
