{
  sw.fonts = {

    nixos = { pkgs, ... }: {
      fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.iosevka
        nerd-fonts.fira-code
        maple-mono.NF-unhinted
      ];
    };
  };
}
