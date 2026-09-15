{ inputs, den, ... }: {
  imports = [
    (inputs.den.namespace "hw" true)
    (inputs.den.namespace "sw" true)
  ];
  _module.args.__findFile = den.lib.__findFile;
}
