{
  hw.zswap.nixos = { pkgs, ... }: {
    boot.zswap = {
      enable = true;
      compressor = "lz4";
    };
  };
}
