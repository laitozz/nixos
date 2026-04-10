{ self, inputs, ... }: {
  flake.nixosModules.nixusConfiguration = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.nixusHardware
      self.nixosModules.packages
      self.nixosModules.networking
    ];

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.lait = {
      isNormalUser = true;
      description = "lait";
      extraGroups = ["networkmanager" "wheel" "uinput" "audio"];
      shell = pkgs.bash;
    };


    programs.sway.enable = true;

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      nerd-fonts.fira-code
    ];

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

    system.stateVersion = "26.05";
  };
}
