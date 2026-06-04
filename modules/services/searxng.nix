{
  sw.searxng.nixos = { pkgs, ... }: {
    services.searx = {
      enable = true;
      settings.server = {
        bind_address = "::1";
        port = 2388;
      };
    };
  };
}
