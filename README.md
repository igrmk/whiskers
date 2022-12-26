Whiskers
========

<img src="whiskers.svg" width="180">

An alternative application icon for [Kitty](https://sw.kovidgoyal.net/kitty/) terminal emulator.
Works best if little flat icons and whiskers on kittens are a few of your favorite things.
[JetBrains Mono](https://www.jetbrains.com/lp/mono/) font was used for angle brackets.

Installation
------------

### Linux

1. Download [`whiskers_256x256.png`](https://github.com/igrmk/whiskers/raw/main/whiskers_256x256.png) to your preferred icons path .e.g `~/.icons` or `~/.local/share/icons`.
2. Edit your `~/.local/share/applications/kitty.desktop` file and set the `Icon` parameter to the **full absolute** path to the `whiskers_256x256.png` icon e.g. `/home/igrmk/.icons/whiskers_256x256.png`.

### macOS

1. Find `kitty.app` in the `Applications` folder, select it and press `⌘ + i`.
2. Drag `whiskers.icns` onto the application icon in the `kitty info` pane.
3. Delete the icon cache and restart `Dock`:

```bash
$ rm /var/folders/*/*/*/com.apple.dock.iconcache; killall Dock
```

### Windows

PRs are welcome.

Development
-----------

You need mac to build icons. Install inkscape and exiftool. Then run `build.sh` script.

Other alternatives
------------------

* https://github.com/k0nserv/kitty-icon
* https://github.com/DinkDonk/kitty-icon
* https://github.com/hristost/kitty-alternative-icon
