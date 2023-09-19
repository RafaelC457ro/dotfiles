local status, cmake = pcall(require, "cmake-tools")
if (not status) then return end

cmake.setup {
  cmake_build_directory = "build",
}

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "cr", "<cmd>CMakeRun<CR>", opts)
keymap.set("n", "cb", "<cmd>CMakeBuild<CR>", opts)
keymap.set("n", "cf", "<cmd>CMakeGenerate<CR>", opts)
keymap.set("n", "ct", "<cmd>CMakeSelectLaunchTarget<CR>", opts)
