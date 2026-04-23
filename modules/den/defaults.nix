{ lib, den, ... }: {
  den.default.nixos.system.stateVersion = "25.11";
  den.default.homeManager.home.stateVersion = "25.11";

  # enable hm by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  # host<->user provides
  den.ctx.user.includes = [ den._.mutual-provider ];

  # Sets the system hostname as defined in den.hosts.<name>.hostName
  den.default.includes = [ den.provides.hostname ];

  # Home manager options
  den.ctx.hm-host.includes = [
    {
      nixos.home-manager = {
        backupFileExtension = "hm_backup";
        useGlobalPkgs = true;
      };
    }
  ];

  # Experimental features by default
  # TODO: find a better place for this
  den.default.nixos.nix.settings.experimental-features = lib.mkDefault [ "nix-command" "flakes" ];
}
