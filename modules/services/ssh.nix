{
  sw.ssh.nixos = { pkgs, ... }: {
    services.openssh.enable = true;
    services.openssh.settings = {
      UseDns = true;
      PasswordAuthentication = true; # TODO: disable!!
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
    programs.mosh.enable = true;
  };
}
