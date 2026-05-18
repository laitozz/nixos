{
  sw.desktop = {
    nixos = { pkgs, ... }: {
      # Desktop packages
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
      programs.kdeconnect.enable = true;
    };
  };
}
