{
  sw.syncthing = { user, ... }: {
    nixos = {
      services.syncthing = {
        enable = true;
        openDefaultPorts = true;
        user = user.name;
        dataDir = "/home/${user.name}";
        overrideFolders = true;
        overrideDevices = true;
        # TODO: set default user and password with sops-nix
        settings = {
          devices = {
            "onix"  = { id = "UEVQTKY-34ZQBJO-Z4DTM2K-M2QO5A5-UA5AUL4-3NQ5CPU-O2Y3HOL-DLWQKQO"; };
            "fenix" = { id = "Y4C57QV-HHB4XMP-6DAEPKM-W7P4ZXV-OWTUQKU-UYY4YV5-HUMHQPI-4M3XSQY"; };
            "nord"  = { id = "QNTINZC-OZDSEQM-P6LR362-5CELMLB-DTVI7KH-UDQPQGU-T4LMRQV-Q6TPGQZ"; };
          };
          folders = {
            "Notes" = {
              path = "~/notes";
              devices = [ "onix" "fenix" "nord" ];
            };
            "Org" = {
              path = "~/org";
              devices = [ "onix" "fenix" "nord" ];
            };
            "Projects" = {
              path = "~/projects";
              devices = [ "onix" "fenix" ];
            };
          };
        };
      };
    };
  };
}
