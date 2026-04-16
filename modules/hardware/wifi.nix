{ hw, ... }: {
  hw.wifi = {
    nixos = { pkgs, ... }: {
      # networking.wireless.iwd.enable = true;
      networking.networkmanager.enable = true;

      environment.systemPackages = with pkgs; [
        impala
      ];
    };
  };
}
