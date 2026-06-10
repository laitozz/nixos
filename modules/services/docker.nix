{
  sw.docker.nixos = { pkgs, ... }: {
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    }; 
  };
}
