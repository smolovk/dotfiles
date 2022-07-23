return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'arcticicestudio/nord-vim'
    use 'scrooloose/nerdtree'
    use 'frazrepo/vim-rainbow'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'jiangmiao/auto-pairs'
    use 'folke/lsp-colors.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use {'akinsho/toggleterm.nvim', tag = 'v1.*'}
    use 'vim-ctrlspace/vim-ctrlspace'
    use {'ibhagwan/fzf-lua', branch = 'main'}
    use 'romgrk/barbar.nvim'
    use 'mattn/emmet-vim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use({
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
        require("lsp_lines").register_lsp_virtual_lines()
      end,
    })
end)
