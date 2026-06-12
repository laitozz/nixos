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
      nodejs # Needed for some treesitter parsers

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
