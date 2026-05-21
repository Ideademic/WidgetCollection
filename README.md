# WidgetCollection
WidgetCollection is a collection of shell widgets. Add these to your `.zshrc` or install them with (Zidgets)[https://github.com/Ideademic/zidgets] or (OhMyZsh)[https://github.com/ohmyzsh/ohmyzsh].

## Blueline Prompt
A minimal prompt in shades of blue, without a username and with git support. Every character matters, and this uses few.
```
zidgets install https://raw.githubusercontent.com/Ideademic/WidgetCollection/refs/heads/main/themes/blueline.zsh-theme
```

## FS Aliases
A small bundle of file/directory helpers: `l`/`ll` time-sorted listings, `mc` (mkdir + cd), `up [N]` (cd up N levels), `cdr` (cd to git root), `bak`/`unbak` (timestamped backup + restore), `lsbig [N]` (biggest entries in pwd), `recent [N]` (most recently modified files).
```
zidgets install https://raw.githubusercontent.com/Ideademic/WidgetCollection/refs/heads/main/plugins/fs-aliases.plugin.zsh
```

## Trash
`trash <files…>` moves files to `~/.Trash` instead of `rm`'ing them — recoverable from Finder. Set `TRASH_DIR` to override the destination.
```
zidgets install https://raw.githubusercontent.com/Ideademic/WidgetCollection/refs/heads/main/plugins/trash.plugin.zsh
```

## Dot Expand
Type `...` and watch it expand inline to `../..`. `....` becomes `../../..`, and so on. You see (and can edit) the path before pressing Enter.
```
zidgets install https://raw.githubusercontent.com/Ideademic/WidgetCollection/refs/heads/main/plugins/dot-expand.plugin.zsh
```

## Niceties
Flips on the zsh options that should arguably be defaults: case-insensitive tab completion (`pro<TAB>` finds `Projects/`), prefix history search (type `ls` then Up to walk only past `ls …` commands), `AUTO_CD`, shared/deduped history, extended globbing, and a few more.
```
zidgets install https://raw.githubusercontent.com/Ideademic/WidgetCollection/refs/heads/main/plugins/niceties.plugin.zsh
```