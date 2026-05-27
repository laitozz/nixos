{
  sw.wireguard.nixos = { pkgs, config, ... }: {
    environment.systemPackages = with pkgs; [ wireguard-tools ];
    networking.wg-quick.interfaces.wg0 = {
      autostart = false;
      address = [ "10.6.0.3/32" ];
      dns = [ "10.6.0.1" ];
      privateKeyFile = config.sops.secrets."wireguard/home-router".path;
      peers = [{
        allowedIPs = [ "0.0.0.0/0" "::/0" ];
        endpoint = "91.153.77.229:51820";
        publicKey = "nV4DqSBWhYa2EP+NhR6Vt85VsQGKZ1WAVPwx9lxGETs=";
        persistentKeepalive = 25;
      }];
    };
    environment.shellAliases = {
      wg0up = "sudo systemctl start wg-quick-wg0.service";
      wg0down = "sudo systemctl stop wg-quick-wg0.service";
      wg0status = "systemctl status wg-quick-wg0.service";
    };
  };
}
