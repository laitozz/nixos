{ den, ... }: {
  den.aspects.desktop = {
    includes = [
      den.aspects.hyprland
      den.aspects.noctalia
      den.aspects.greeter
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
