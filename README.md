# nonbili-nix-deps


## Install

```
nix-env -f https://github.com/nonbili/nonbili-nix-deps/archive/master.tar.gz -iA purs spago zephyr
```

## Development

```sh
git clone https://github.com/nonbili/nonbili-nix-deps
cd nonbili-nix-deps
# Test
nix-shell
# Install
nix-env -f . -iA purs spago zephyr
```
