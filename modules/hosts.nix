# defines all hosts + users + homes.
# then config their aspects in as many files you want
{

  den.hosts.x86_64-linux.fenix.users.lait = { };        # laptop
  den.hosts.x86_64-linux.onix.users.lait = { };         # desktop
  # den.hosts.x86_64-linux.nixie.users.lait = { };
  # den.hosts.x86_64-linux.garnix.users.lait = { };     # for minimal setup?
  # den.hosts.x86_64-linux.nocturnix.users.lait = { };  # for server?
  # den.hosts.x86_64-linux.clinix.users.lait = { };     # harmonix, technix

  # define an standalone home-manager for tux
  # den.homes.x86_64-linux.tux = { };

  # be sure to add nix-darwin input for this:
  # den.hosts.aarch64-darwin.apple.users.alice = { };

  # other hosts can also have user tux.
  # den.hosts.x86_64-linux.south = {
  #   wsl = { }; # add nixos-wsl input for this.
  #   users.tux = { };
  #   users.orca = { };
  # };
}
