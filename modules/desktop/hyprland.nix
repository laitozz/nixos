{ den, ... }: {
  den.aspects.hyprland = {
    nixos = { pkgs, ... }: {

      programs.hyprland = {
        enable = true;
      };
      environment.systemPackages = with pkgs; [
        waybar
        hyprpaper
        hyprlock
        wlogout
        awww
        pywal
        grim
        slurp
        mako
      ];
      # autostart Hyprland
      # environment.loginShellInit = ''
      #   [[ "$(tty)" == /dev/tty1 ]] && exec start-hyprland
      # '';

    };
  };
}
