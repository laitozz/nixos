{
  sw.dotfiles = { 
    homeManager = { lib, config, pkgs, ... }: { 
      
      config = let
        dotfilePath = "${config.home.homeDirectory}/dotfiles/";
        linkConfigFile = name: {
          xdg.configFile.${name}.source =
            config.lib.file.mkOutOfStoreSymlink "${dotfilePath}/${name}";
        };
        linkHomeFile = name: {
          home.file."${name}".source =
            config.lib.file.mkOutOfStoreSymlink "${dotfilePath}/${name}";
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
