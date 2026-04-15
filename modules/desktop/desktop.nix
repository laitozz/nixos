{ den, ... }: {
  den.aspects.desktop = {
    includes = [
      den.aspects.hyprland
    ];
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        firefox
        kitty
      ];
      programs.sway.enable = true;
    };
  };
}
