{ inputs, ... }: {
  # NOTE: can be run without installation with
  # nix run github:FreesmTeam/FreesmLauncher#freesmlauncher
  # And threrefore is not included
  flake-file.inputs = {
    freesmlauncher = {
      url = "github:FreesmTeam/FreesmLauncher";
      # NOTE: pinning will break binary cache
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  sw.minecraft.nixos = { pkgs, freesmlauncher, system, ... }: {
    environment.systemPackages = with pkgs; [
      # inputs.freesmlauncher.packages."x86_64-linux".freesmlauncher
      # NOTE: build seems broken currently
      # So i'm installing deps with prism and running freesm with comma
      prismlauncher
    ];
    # NOTE: use nixos-firewall-tool instead
    networking.firewall.allowedTCPPorts = [ 6767 ];
    # Use cache for rebuilds
    # TODO: move to nixconfig.nix
    nix.settings.substituters = [
      "https://cache.garnix.io"
    ];
    nix.settings.trusted-substituters = [
      "https://cache.garnix.io"
    ];
    nix.settings.trusted-public-keys = [
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };
}
