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
        helix
        gnumake
        lazygit
        tmux
        fzf
        iwd
        nh
        yazi
        btop

        python3
        lua5_4

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
