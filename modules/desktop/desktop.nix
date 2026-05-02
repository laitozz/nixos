{ sw, ... }: {
  sw.desktop = {
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
