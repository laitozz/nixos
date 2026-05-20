{
  # NOTE: can be run without installation with
  # nix run github:FreesmTeam/FreesmLauncher#freesmlauncher
  # And threrefore is not included
  flake-file.inputs = {
    freesmlauncher = {
      url = "github:FreesmTeam/FreesmLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  sw.minecraft.nixos = { pkgs, freesmlauncher, system, ... }: {
    environment.systemPackages = with pkgs; [
      freesmlauncher.packages.${system}.freesmlauncher
    ];
    # NOTE: use nixos-firewall-tool instead
    # networking.firewall.allowedTCPPorts = [ 6767 ];
  };
}
