{ hw, ... }: {
  hw.keyd.nixos = { pkgs, ... }: {
    # NOTE: sudo keyd monitor for ids
    environment.systemPackages = [ pkgs.keyd ];
    # TODO: do not apply for custom keyboard
    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [
            "*" # Apply to everything
            "0001:0001:09b4e68d" # Fenix laptop keyboard, for reference
          ]; 
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
