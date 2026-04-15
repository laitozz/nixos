{ den, ... }: {
  den.aspects.desktop = {
    includes = [
      den.aspects.hyprland
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
