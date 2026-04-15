{ lib, den, ... }: {
  den.default.nixos.system.stateVersion = "25.11";
  den.default.homeManager.home.stateVersion = "25.11";

  # enable hm by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  # host<->user provides
  den.ctx.user.includes = [ den._.mutual-provider ];

  # Experimental features by default
  # TODO: find a better place for this
  den.default.nixos.nix.settings.experimental-features = lib.mkDefault [ "nix-command" "flakes" ];
}
