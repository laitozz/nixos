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
