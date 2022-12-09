local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    vim.cmd([[packadd packer.nvim]])
    print("Installing packer close and reopen Neovim...")
end

-- autocommand that reloads neovim whenever you save the plugins.lua file
local packer_config_ag = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    desc = "reload packer config and install plugins after file save",
    pattern = "plugins.lua",
    command = "source <afile> | PackerSync",
    group = packer_config_ag,
})

-- require packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- -- have packer use a popup window
-- packer.init({
--   display = {
--     open_fn = function()
--       return require('packer.util').float({ border = 'rounded' })
--     end,
--   },
-- })

-- setup packer and install plugins
packer.startup(function(use)
    -- have packer manage itself
    use("wbthomason/packer.nvim")

    -- useful plugins required by other plugins
    use("nvim-lua/plenary.nvim") -- lua functions pre-defined

    -- faster nvim startup times
    use("lewis6991/impatient.nvim") -- uses caching and precompilation of nvim lua files

    -- colorschemes (from vimcolorschemes.com)
    use("sainnhe/everforest")
    use("morhetz/gruvbox")
    use("joshdick/onedark.vim")
    use("tomasr/molokai")
    use("NLKNguyen/papercolor-theme")
    use("ayu-theme/ayu-vim")
    use("dracula/vim")
    use("romainl/Apprentice")
    use("tomasiser/vim-code-dark")
    use("pineapplegiant/spaceduck")
    use("lifepillar/vim-gruvbox8")
    use("jonathanfilip/vim-lucius")
    use("cormacrelf/vim-colors-github")
    use("tpope/vim-vividchalk")
    use("lunarvim/darkplus.nvim")

    -- completion plugins (from https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources)
    use("hrsh7th/nvim-cmp") -- base cmp plugin
    use("hrsh7th/cmp-nvim-lsp") -- lsp completions
    use("hrsh7th/cmp-buffer") -- completion from buffer
    use("hrsh7th/cmp-path") -- path completion
    use("hrsh7th/cmp-cmdline") -- vim cmdline completion
    use("Saecki/crates.nvim") -- creates.io version and package completion
    use("David-Kunz/cmp-npm") -- npm package and version completion
    use({ "tzachar/cmp-tabnine", run = "./install.sh" }) -- tabnine completions
    use("hrsh7th/cmp-emoji") -- markdown emoji completion
    use("hrsh7th/cmp-nvim-lua") -- neovim lua api completion
    use("saadparwaiz1/cmp_luasnip") -- snippet completion

    -- snippets
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("rafamadriz/friendly-snippets") -- large set of snippets

    -- lsp
    use("neovim/nvim-lspconfig") -- setup nvim lsp
    use("williamboman/mason.nvim") -- lsp gui installer
    use("williamboman/mason-lspconfig.nvim") -- adapter for mason to lspconfig
    use("jay-babu/mason-nvim-dap.nvim") -- adapter for mason to nvim dap
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("jose-elias-alvarez/null-ls.nvim")
    use({ "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" }) -- better syntax highlighting by using the lsp
    use("numToStr/Comment.nvim") -- better comments

    -- better rust development
    use("simrat39/rust-tools.nvim")

    -- tmux integration
    use("christoomey/vim-tmux-navigator") -- tmux navigation integration

    -- file search
    use("nvim-telescope/telescope.nvim") -- fuzzy finder with file preview
    use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }) -- gui file browser as a replacement for netrw

    -- git integration
    use("lewis6991/gitsigns.nvim") -- gitsigns on the side of the buffer

    -- panels
    use("nvim-lualine/lualine.nvim")
    use("stevearc/dressing.nvim") -- better windows (eg. rename popup)

    -- code integration
    use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
    use("stevearc/aerial.nvim")

    -- markdown preview
    use("ellisonleao/glow.nvim")

    -- load config when cloning packer
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
