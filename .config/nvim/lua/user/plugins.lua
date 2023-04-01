-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim... :PackerCompile")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Packer was not found!")
    return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = 'single' })
        end,
	},
})

-- If the plugins stops working you can specify a specific commit.
-- use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" }
return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Fuzzy Finder
    use { 'junegunn/fzf', run = ":call fzf#install()" }
    use 'junegunn/fzf.vim'

    -- Autopair
    use 'windwp/nvim-autopairs'

    -- Colorscheme
    use 'sjl/badwolf'

    -- cmp
    use 'hrsh7th/nvim-cmp'              -- Main completion
    use 'hrsh7th/cmp-buffer'            -- Buffer completions
    use 'hrsh7th/cmp-path'              -- Path completions
    use 'saadparwaiz1/cmp_luasnip'      -- Snipper completions
    use 'hrsh7th/cmp-nvim-lsp'
    --use 'hrsh7th/cmp-nvim-lua'

    -- Snippets
    use 'L3MON4D3/LuaSnip'              -- Snippet engine
    use 'rafamadriz/friendly-snippets'  -- Includes many more snippets

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- LSP
    use 'neovim/nvim-lspconfig'             -- Enable LSP support
    use('williamboman/mason.nvim', {run = ':MasonUpdate'}) -- Language server
    use 'williamboman/mason-lspconfig.nvim' -- Register a setup hook with lspconfig for mason.nvim
    use 'RRethy/vim-illuminate'             -- Illimunate text that matches

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
