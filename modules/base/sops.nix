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
  };
}
