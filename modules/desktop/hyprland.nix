{ sw, ... }: {
  sw.hyprland = {
    nixos = { pkgs, ... }: {

      programs.hyprland = {
        enable = true;
      };
      # Packages useful with hyprland
      environment.systemPackages = with pkgs; [
        waybar
        hyprpaper
        hyprlock
        hyprcursor
        hyprsunset
        wlogout
        awww
        pywal
        # Screenshots
        grim
        slurp
        # Notification deamon
        mako
        # Clipboard
        wl-clipboard
        cliphist
      ];
      # Force apps to use wayland when possible
      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };
    };
  };
}
# TODO: set hyprland cursor with hyprcursor or preferably gtk
# https://wiki.hypr.land/0.41.0/Nix/Hyprland-on-Home-Manager/#fixing-problems-with-themes
