{ sw, hw, ... }: {
  # host aspect
  den.aspects.onix = {

    # Which software modules to use
    provides.to-users.includes = [ sw.templates._.full ];

    # Included hardware modules
    includes = [
      hw.wifi
      hw.bluetooth
      hw.power
      hw.grub
      hw.qmk
      hw.nvidia
    ];

    # Hardware config 
    nixos = { config, lib, pkgs, modulesPath, ... }: {
      
      # TODO: do this automatically for each host (with den.ctx?)
      environment.sessionVariables.NH_FLAKE = "$HOME/dotfiles/nixos#onix";

      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];
      
      # Force unset grub timeout
      boot.loader.timeout = lib.mkForce null;

      boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
      boot.initrd.kernelModules = [];
      boot.kernelModules = ["kvm-intel"];
      boot.extraModulePackages = [];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/60519ee7-7a0c-4782-bb68-39b3c24e74b7";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/88EC-68E5";
        fsType = "vfat";
        options = ["fmask=0077" "dmask=0077"];
      };

      swapDevices = [
        {device = "/dev/disk/by-uuid/77bcbb71-eda6-4fac-b31f-cc1faeb9b07c";}
      ];

      # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
      # (the default) this is the recommended approach. When using systemd-networkd it's
      # still possible to use this option, but it's recommended to use it in conjunction
      # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
      networking.useDHCP = lib.mkDefault true;
      # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;
      # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      hardware.nvidia.modesetting.enable = lib.mkDefault true;

    };
  };
}
