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
            "onix" = { id = "6I7HXSC-TPKCWOA-QPAYBZX-QRUTEZH-E4A6E3I-ICMMRP3-TVGI3EQ-GYVBGQN"; };
            # "fenix" = { id = ""; };
            # "nord" = { id = ""; };
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
