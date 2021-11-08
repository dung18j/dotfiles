{ pkgs, ... }:
{

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
  
  environment.variables.EDITOR = "nvim";
  
  environment.systemPackages = with pkgs; [
    (neovim.override {
      viAlias = true;
      vimAlias = true;
      configure = {
        customRC = ''
            luafile /home/dungph/.dotfiles/nvim/settings.lua
        '';
        packages.myVimPackage = with pkgs.vimPlugins; {
          # loaded on launch
          start = [ 
            # ident vertical line
            indentLine

            # auto complete
            nvim-cmp
            cmp-nvim-lsp
            cmp-path
            cmp-buffer
            cmp-vsnip
            vim-vsnip

            # Lsp stuff
            vim-nix
            nvim-lspconfig
            rust-tools-nvim
            popup-nvim
            plenary-nvim
            telescope-nvim
            nvim-dap
            lspsaga-nvim
            rust-vim

            # color
            nord-vim
            nvim-treesitter

            # nvim tree
            nvim-web-devicons 
            nvim-tree-lua

            # markdown preview
            glow-nvim
          ];
          # manually loadable by calling `:packadd $plugin-name`
          opt = [ ];
        };
      };
    })
  ];
}
