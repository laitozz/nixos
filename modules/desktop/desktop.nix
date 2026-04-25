{ sw, ... }: {
  sw.desktop = {
    includes = [
      sw.hyprland
      sw.noctalia
      sw.ly
      sw.emacs
      sw.gaming
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
		
        ncspot
      ];
      programs.sway.enable = true;
    };
  };
}
