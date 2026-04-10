{ self, inputs, ... }: {
  flake.nixosModules.networking = { pkgs, lib, ... }: {
    networking.wireless.iwd.enable = true;

    environment.systemPackages = with pkgs; [
      impala
    ];
  };
}
