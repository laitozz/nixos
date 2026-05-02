{
  sw.nextcloud.nixos = { pkgs, ... }: {
    environment.etc."nextcloud-admin-pass".text = "this is a password";
    services.nextcloud = {
      enable = true;
      hostName = "cloud.com";
      config.adminpassFile = "/etc/nextcloud-admin-pass";
      config.dbtype = "sqlite";
    };
  };
}
