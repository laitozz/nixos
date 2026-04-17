{ hw, ... }: {
  hw.grub.nixos = { pkgs, ... }: {
    boot.loader = {
      systemd-boot.enable = false;
      timeout = 5;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
        extraEntries = ''
          menuentry "PowerOff" {
            halt
          }
        '';
        # theme = pkgs.sleek-grub-theme.override { withStyle = "dark"; };
      };
    };
  };
}
