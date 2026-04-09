{ self, inputs, ... }: {
  flake.nixosConfigurations.nixus = inputs.nixpkgs.lib.nixosSystem {
    modules = [ 
      self.nixosModules.nixusConfiguration 
    ];
  };
}
