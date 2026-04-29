{
  sw.emacs.nixos = { pkgs, ... }: {
    # NOTE: automatically starts emacs daemon
    # TODO: Use exec-once emacs --daemon instead
    services.emacs.enable = true;
    # dependencies
    fonts.packages = with pkgs; [
      # symbola # UNFREE
    ];
    environment.systemPackages = with pkgs; [
      ripgrep
      fd
      cmake
      ispell # org mode
      
      # Install script
      (pkgs.writeShellScriptBin "doomEmacsInstallScript" ''
        emacsDir=$HOME/.config/emacs
        if [ ! -d "$emacsDir" ] || [ ! -z "$(ls -A $emacsDir)" ]; then
          echo "Emacs configuration already exists."
          read -p "Remove it? (y/N): " continue
          [[ ''${continue^^} != 'Y' ]] && echo "Exiting" && exit 1
          echo "rm -rf $emacsDir"
          rm -rf $emacsDir
        fi

        git clone --depth 1 https://github.com/doomemacs/doomemacs $emacsDir
        $emacsDir/bin/doom install

        echo "Adding $emacsDir/bin to fish_user_paths"
        fish -c "fish_add_path $HOME/.config/emacs/bin"

        echo "Doom emacs is now installed to $emacsDir"
        echo "Make sure to manually remove all other emacs configurations"
        echo "For example ~/.emacs.d"
      '')
    ];
  };
}
