{
  den.aspects.packages = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          coreutils
          libtool
          gcc
          git
          vim
          neovim
          # helix
          # gnumake
          # lazygit
          # tmux
          # fzf
          # zsh
          # iwd
          # nh
          # yazi

          firefox
          kitty
        ];
        programs.sway.enable = true;
      };
    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.fastfetch ];
    };
  };
}
