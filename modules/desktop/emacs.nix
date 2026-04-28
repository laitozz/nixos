{
  sw.emacs.nixos = { pkgs, ... }: {
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
        # Add directory to fish path
        fish -c "fish_add_path $HOME/.config/emacs/bin"
      '')
    ];
  };
}
