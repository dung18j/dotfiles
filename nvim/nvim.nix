{ pkgs, ... }:
{
  # Enable neovim (default editor)
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    configure = {
      customRC = ''
          luafile /home/dungph/.dotfiles/nvim/settings.lua
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        # loaded on launch
        start = [ 
          nvim-cmp
          indentLine
          vim-nix
          nvim-lspconfig
          cmp-nvim-lsp
          cmp-vsnip
          cmp-path
          cmp-buffer
          rust-tools-nvim
          popup-nvim
          plenary-nvim
          telescope-nvim
          nvim-dap
          lspsaga-nvim
          rust-vim
          glow-nvim
          nord-vim
          nvim-treesitter
          nvim-web-devicons 
          nvim-tree-lua
        ];
        # manually loadable by calling `:packadd $plugin-name`
        opt = [ ];
      };
    };
  };
}
