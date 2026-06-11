{
  sw.packages = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        coreutils
        libtool
        gcc
        unzip
        git
        vim
        neovim
        helix
        gnumake
        lazygit
        tmux
        fzf
        iwd
        nh
        yazi
        btop

        ripgrep
        fd
        skim
        bat
        eza
        lsd
        dust
        dua

        nix-index
        nix-inspect
        nix-fast-build
      ];
      programs.zsh.enable = true;
    };
  };
}
