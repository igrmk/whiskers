Whiskers
========

<img src="whiskers.svg" width="180">

An alternative application icon for [Kitty](https://sw.kovidgoyal.net/kitty/) terminal emulator.
Works best if little flat icons and whiskers on kittens are a few of your favorite things.
[JetBrains Mono](https://www.jetbrains.com/lp/mono/) font was used for angle brackets.

Installation
------------

Run `make -j all` to build the image files. If `pngcrush` is installed, `png` images will be optimized using the default optimizer.

### Linux

1. Download [`whiskers_256x256.png`](https://github.com/igrmk/whiskers/raw/main/whiskers_256x256.png) to your preferred icons path .e.g `~/.icons` or `~/.local/share/icons`.
2. Edit your `~/.local/share/applications/kitty.desktop` file and set the `Icon` parameter to the **full absolute** path to the `whiskers_256x256.png` icon e.g. `/home/igrmk/.icons/whiskers_256x256.png`.

### macOS

[Download](https://github.com/igrmk/whiskers/archive/refs/heads/main.zip) or
clone this repo, `cd` into it, and run

    make -j install-osx

This will build an `icns` file and install it to `/Applications/kitty.app`.

### Windows

PRs are welcome.

Other alternatives
------------------

* https://github.com/k0nserv/kitty-icon
* https://github.com/DinkDonk/kitty-icon
* https://github.com/hristost/kitty-alternative-icon
