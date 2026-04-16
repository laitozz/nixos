{ inputs, den, ... }: {
  imports = [
    (inputs.den.namespace "hw" true)
  ];
  _module.args.__findfile = den.lib.__findfile;
}
