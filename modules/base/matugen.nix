{
  # NOTE: also has a flake
  # https://github.com/InioX/matugen/issues/28
  sw.matugen.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      matugen
    ];
  };
}
