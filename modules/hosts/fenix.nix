{ den, ... }: {
  # host aspect
  den.aspects.fenix = {
    includes = [
      den.aspects.packages
      den.aspects.wifi
      den.aspects.desktop
    ];

    # host provides default home environment for its users
    provides.to-users.homeManager = { pkgs, ... }: {
      home.packages = [ ];
    };

    # host NixOS configuration
    nixos = { config, lib, pkgs, modulesPath, ... }: {
      
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

      # grub
      # TODO: move to hardware/grub
      boot.loader.systemd-boot.enable = false;
      boot.loader.grub.enable = true;
      boot.loader.grub.device = "nodev";
      boot.loader.grub.useOSProber = true;
      boot.loader.grub.efiSupport = true;
      boot.loader.timeout = null;
      boot.loader.grub.extraEntries = ''
        menuentry "PowerOff" {
          halt
        }
      '';
      boot.loader.efi.canTouchEfiVariables = true;
      };
  };
}
