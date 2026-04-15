{ den, ... }: {
  den.aspects.hyprland = {
    nixos = { pkgs, ... }: {

      programs.hyprland = {
        enable = true;
      };
      environment.systemPackages = with pkgs; [
        waybar
        pyprland
        hyprpaper
        hyprlock
        wlogout
        swww
        grim
        slurp
      ];
      # autostart Hyprland
      # TODO: figure out a less hacky way to do this
      environment.loginShellInit = ''
        [[ "$(tty)" == /dev/tty1 ]] && exec Hyprland
      '';

    };
  };
}
