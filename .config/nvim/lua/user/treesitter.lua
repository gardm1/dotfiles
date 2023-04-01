local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
        return
end

configs.setup({
  ensure_installed = { "c", "cpp", "go" }, -- one of "all" or a list of languages
        highlight = {
                enable = true, -- false will disable the whole extension
        },
        autopairs = {
                enable = true,
        },
        -- indent = { enable = true }, -- Not needed, done by other means, I think
})
