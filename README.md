## Configuration layout
* Configuration is seperated to two namespaces:
    * Hardware (hw)
        * Configured on host level
    * Software (sw)
        * Configured per user
        * Provides bundles: sw.base and sw.desktop


## Possible configuration pipelines
#### define host specific options in hosts.nix
* Use den.schema for defining options
* Set option values for each host / user
* https://den.oeiuwq.com/reference/schema

#### Parametric aspects
* Aspects take a host (or user) parameter
* They can access for example host.hardened

#### Still need to figure out:
* How to pass arguments directly to aspects
* Is it possible to configure options within host aspect
    * Would be syntatically nicer
* What exactly to store in the options
    * And what should be selectable by including aspects

## TODO:
* __Reorganise__ everything so that only two configuration sets remain
    * Full for a full hyprland desktop with all config
    * Minimal for a small sway based setup with low disk usage
* Syncthing
* Secrets (agenix?)
* Disk ISO (laitOS)
* Emacs (doom flake?)
* Hyprland cursor
