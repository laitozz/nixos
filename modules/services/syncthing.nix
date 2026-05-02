{
  sw.syncthing = { user, ... }: {
    nixos = {
      services.syncthing = {
        enable = true;
        openDefaultPorts = true;
        user = user.name;
        dataDir = "/home/${user.name}";
        overrideFolders = false;
        overrideDevices = false;
        # TODO: set default user and password with sops-nix
        settings = {
          devices = {
            "Onix"  = { id = "UEVQTKY-34ZQBJO-Z4DTM2K-M2QO5A5-UA5AUL4-3NQ5CPU-O2Y3HOL-DLWQKQO"; };
            "Fenix" = { id = "Y4C57QV-HHB4XMP-6DAEPKM-W7P4ZXV-OWTUQKU-UYY4YV5-HUMHQPI-4M3XSQY"; };
            "Nord"  = { id = "XZZVVZT-MQ7ZGEH-HRWDQI6-SEPWSIS-WXOME3C-AA7WUSI-MINQ5YN-JXBTNAD"; };
          };
          folders = {
            "Notes" = {
              path = "~/notes";
              devices = [ "Onix" "Fenix" "Nord" ];
              ignorePatterns = [ ".git" ];
            };
            "Org" = {
              path = "~/org";
              devices = [ "Onix" "Fenix" "Nord" ];
              ignorePatterns = [ ".git" ];
            };
          };
        };
      };
    };
  };
}
