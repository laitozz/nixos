{ self, inputs, ... }: {
  flake.nixosModules.packages = { pkgs, lib, ... }: {
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
      iwd
      nh
      yazi

      # rust 
      ripgrep
      fd
      bat
      eza
      lsd
      dust
      dua

      # nix
      nix-index
      nix-inspect
      nix-fast-build

      firefox
      foot
      kitty
      pywal
    ];
  };
}
