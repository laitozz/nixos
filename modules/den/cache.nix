{ sw, ... }: {
  # sw.cachix "name" "public-key" → an aspect that wires the cache everywhere
  sw.cachix = name: key: {
    # flake class: reflects into the generated flake.nix nixConfig
    flake-file.nixConfig = {
      extra-substituters = [ "https://${name}.cachix.org" ];
      extra-trusted-public-keys = [ key ];
    };
    # OS classes: reflects into /etc/nix/nix.conf on the host
    nixos.nix.settings = {
      substituters = [ "https://${name}.cachix.org" ];
      trusted-public-keys = [ key ];
    };
  };
  den.default.includes = [
    (sw.cachix "nix-community" "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=")
  ];
}

