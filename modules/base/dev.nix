{
  sw.dev.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      # Lsp
      nil
      nixd
      bash-language-server
      lua-language-server
      csharp-ls
      clang-tools
      gdb

      tree-sitter

      devenv
    ];

    programs = {
      direnv = {
        enable = true;
        silent = true;
        nix-direnv.enable = true;
      };
    };
  };
}
