{ self, inputs, ... }: {
  flake.homeConfigurations.lait = { lib, config, ... }: {
    imports = [
      self.homeModules.dotfiles
    ];

    home.username = "lait";
    home.homeDirectory = "/home/lait";
  
    manual.manpages.enable = true;
    programs.home-manager.enable = true;

    home.stateVersion = "24.11";
  };
}
