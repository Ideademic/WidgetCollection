# trash — move files to ~/.Trash instead of `rm`ing them, so they're recoverable from Finder.
# Set TRASH_DIR before sourcing to override the destination (e.g. for Linux).

: ${TRASH_DIR:=$HOME/.Trash}

trash() {
  [[ -d $TRASH_DIR ]] || mkdir -p -- "$TRASH_DIR"
  local f base dest
  for f in "$@"; do
    if [[ ! -e $f && ! -L $f ]]; then
      print -u2 "trash: $f: no such file or directory"
      continue
    fi
    base=${f:t}
    dest="$TRASH_DIR/$base"
    # collision with an already-trashed entry of the same name: timestamp the new one
    if [[ -e $dest || -L $dest ]]; then
      dest="$TRASH_DIR/${base}.$(date +%Y%m%d-%H%M%S)"
    fi
    mv -- "$f" "$dest"
  done
}
