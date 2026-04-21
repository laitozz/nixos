{ hw, ... }: {
  hw.keyd.nixos = { pkgs, ... }: {
    # FIXME: keyd complains about a group and no permissions
    environment.systemPackages = [ pkgs.keyd ];
    # TODO: do not apply for custom keyboard
    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ]; # what goes into the [id] section, here we select all keyboards
          settings = {
            main = {
              capslock = "overload(control, esc)";
            };
            otherlayer = {};
          };
        };
      };
    };
  };
}
