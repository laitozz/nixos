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
        anyrun # TODO: dotfiles for this
		
        ncspot
      ];
      programs.sway.enable = true;
      programs.kdeconnect.enable = true;
    };
  };
}
