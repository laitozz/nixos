{
  sw.dev.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      devenv
    ];
  };
}
