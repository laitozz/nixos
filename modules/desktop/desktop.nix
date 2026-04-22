{ sw, ... }: {
  sw.desktop = {
    includes = [
      sw.hyprland
      sw.noctalia
      sw.ly
    ];
    # Here goes a minimal sway-based config
    provides.minimal.includes = [

    ];
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        firefox
        kitty

        wofi
        rofi
        fuzzel
        tofi
      ];
      programs.sway.enable = true;
    };
  };
}
