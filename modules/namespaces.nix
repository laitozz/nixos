{ inputs, den, ... }: {
  imports = [
    (inputs.den.namespace "hw" true)
    (inputs.den.namespace "sw" true)
  ];
  _module.args.__findfile = den.lib.__findfile;
}
