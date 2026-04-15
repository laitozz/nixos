{
  den.aspects.packages = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        coreutils
        libtool
        gcc
        git
        vim
        neovim
        helix
        gnumake
        lazygit
        tmux
        fzf
        zsh
        fish
        iwd
        nh
        yazi

        ripgrep
        fd
        bat
        eza
        lsd
        dust
        dua

        nix-index
        nix-inspect
        nix-fast-build
      ];

      fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.iosevka
        nerd-fonts.fira-code
      ];
    };
  };
}
