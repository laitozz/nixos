{ den, ... }: {
  # host aspect
  den.aspects.fenix = {

    # host provides default home environment for its users
    provides.to-users.homeManager = { pkgs, ... }: {
      home.packages = [ ];
    };

    # host NixOS configuration
    nixos = { config, lib, pkgs, modulesPath, ... }: {
      
      # TODO: do this automatically for each host (with den.ctx?)
      environment.sessionVariables.NH_FLAKE = "$HOME/dotfiles/nixos#fenix";

      # Hardware config 
      # TODO: find a way to seperate from rest of host config?
      imports =
        [ (modulesPath + "/installer/scan/not-detected.nix")
        ];

      boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-amd" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" =
        { device = "/dev/disk/by-partlabel/nixpart";
          fsType = "ext4";
        };

      fileSystems."/boot" =
        { device = "/dev/disk/by-partlabel/bootpart";
          fsType = "vfat";
          options = [ "fmask=0077" "dmask=0077" ];
        };

      swapDevices =
        [ { device = "/dev/disk/by-partlabel/swappart"; }
        ];

      # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
      # (the default) this is the recommended approach. When using systemd-networkd it's
      # still possible to use this option, but it's recommended to use it in conjunction
      # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
      networking.useDHCP = lib.mkDefault true;
      # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;
      # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    };
  };
}
