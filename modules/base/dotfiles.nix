{ den, ... }: {
  den.aspects.dotfiles = { 
    homeManager = { lib, config, pkgs, ... }: { 
      
      # TODO: do this the den way
      options = {
        my.dotfiles.path = lib.mkOption {
          type = lib.types.path;
          default = "${config.home.homeDirectory}/dotfiles/";
          description = ''
            dotfiles path as a string
          '';
        };
      };

      config = let
        linkConfigFile = name: {
          xdg.configFile.${name}.source =
            config.lib.file.mkOutOfStoreSymlink "${config.my.dotfiles.path}/${name}";
        };
        linkHomeFile = name: {
          home.file."${name}".source =
            config.lib.file.mkOutOfStoreSymlink "${config.my.dotfiles.path}/${name}";
        };
      in lib.mkMerge 
      (
        map linkConfigFile [
          "nvim"
          "wlogout"
          "rofi"
          "tofi"
          "hypr"
          "wal"
          "sway"
          "tmux"
          "waybar"
          "kitty"
          "ghostty"
        ] ++
        map linkHomeFile [
          ".vimrc"
          ".zshrc"
          ".profile"
        ]
      );
    };
  };
}
