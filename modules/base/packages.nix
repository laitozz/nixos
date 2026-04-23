{
  sw.packages = {
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
        iwd
        nh
        yazi

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

        # LSPs
        # NOTE: the combined size of these is over 2GB
        # TODO: organice this, make optional
        nil
        nixd
        bash-language-server
        lua-language-server
        csharp-ls
        clang-tools
        gdb
      ];
      programs.zsh.enable = true;

      fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.iosevka
        nerd-fonts.fira-code
      ];
    };
  };
}
