{ den, hw, ... }: {
  hw.nvidia = {
    # includes = [
    #   (den.provides.unfree "nvidia-x11")
    # ];
    nixos = { pkgs, ... }: {
      # services.xserver.videoDrivers = ["nvidia"];
      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        nvidiaSettings = true;
        open = true;
      };
    };
  };
}
