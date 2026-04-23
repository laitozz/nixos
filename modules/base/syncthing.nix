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
            "onix" = { id = "UEVQTKY-34ZQBJO-Z4DTM2K-M2QO5A5-UA5AUL4-3NQ5CPU-O2Y3HOL-DLWQKQO"; };
            # "fenix" = { id = ""; };
            "nord" = { id = "QNTINZC-OZDSEQM-P6LR362-5CELMLB-DTVI7KH-UDQPQGU-T4LMRQV-Q6TPGQZ"; };
          };
          folders = {
            "Notes" = {
              path = "~/notes";
              devices = [ "onix" ];
            };
            "Org" = {
              path = "~/org";
              devices = [ "onix" ];
            };
          };
        };
      };
    };
  };
}
