local modules = {
    require('undo'),
    require('input'),
    require('navigation'),
    require('lsp'),
    require('ui'),
}

for i, module in pairs(modules) do
    module.config()
end

local index = 1
local dependencies = {}
for i, module in pairs(modules) do
    local part = module.dependencies()
    for j, entry in pairs(part) do
        dependencies[index] = entry
        index = index + 1
    end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(dependencies)

for i, module in pairs(modules) do
    module.after()
end
