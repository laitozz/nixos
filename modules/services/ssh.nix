{
  sw.ssh.nixos = { pkgs, ... }: {
    services.openssh.enable = true;
    services.openssh.settings = {
      UseDns = true;
      PasswordAuthentication = false;
    };
  };
}
