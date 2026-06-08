{ inputs, ... }: {
  flake-file.inputs = {
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  sw.sops.nixos = { pkgs, ... }: {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];
    environment.systemPackages = with pkgs; [
      ssh-to-age
      sops
      age
    ];
    # TODO: Add desktop and confirm this works
    sops.defaultSopsFile = ../../secrets/common.yaml;
    sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    sops.age.keyFile = "/var/lib/sops-nix/key.txt";
    sops.age.generateKey = true;
    # Secrets
    sops.secrets."wireguard/home-router" = { };
    sops.secrets."searx" = { };
  };
}
