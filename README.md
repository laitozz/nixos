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
* Move some packages to "dev" directory
* Disk ISO (laitOS)

## Personal notes
* Building iosevka takes an hour, so __don't__ do it
* Do not pin nixpkgs on packages with binary caches
    * Will cause cache misses
    * https://www.reddit.com/r/NixOS/comments/1hhizxa/how_to_correctly_use_inputsfollows/
