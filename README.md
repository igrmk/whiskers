Whiskers
========

<img src="whiskers.svg" width="220">

An alternative application icon for [Kitty](https://sw.kovidgoyal.net/kitty/) terminal emulator.
Works best if little flat icons and whiskers on kittens are a few of your favorite things.
[JetBrains Mono](https://www.jetbrains.com/lp/mono/) font was used for angle brackets.

Installation
------------

### Linux

1. Download [`whiskers.svg`](https://github.com/igrmk/whiskers/raw/main/whiskers.svg) to your preferred icons path .e.g. `~/.icons` or `~/.local/share/icons`.
2. Edit your `~/.local/share/applications/kitty.desktop` file and set the `Icon` parameter to the **absolute** path to the `whiskers.svg` icon e.g. `/home/igrmk/.icons/whiskers.svg`.

### macOS

See the official FAQ: [https://sw.kovidgoyal.net/kitty/faq/#i-do-not-like-the-kitty-icon](https://sw.kovidgoyal.net/kitty/faq/#i-do-not-like-the-kitty-icon)

Development
-----------

You need mac to build icons. Install inkscape and exiftool. Then run `build.sh` script.

Other alternatives
------------------

* https://github.com/igrmk/twiskers
* https://github.com/k0nserv/kitty-icon
* https://github.com/DinkDonk/kitty-icon
* https://github.com/hristost/kitty-alternative-icon
