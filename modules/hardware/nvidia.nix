{ den, hw, ... }: {
  hw.nvidia = {
    includes = [
      (den.batteries.unfree [
        "nvidia"
        "nvidia-x11"
        "nvidia-settings"
        "nvidia-persistenced"
        "nvidia-kernel-modules"
      ])
    ];
    nixos = { pkgs, ... }: {
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        nvidiaSettings = true;
        open = false;
      };
    };
  };
}
