# fs-aliases — small file/directory helpers.

# Listing: time-sorted, hidden files included.
alias l='ls -tA'
alias ll='ls -lhAt'

# `mc foo/bar` — mkdir -p && cd.
mc() {
  [[ -n $1 ]] || { print -u2 "usage: mc <dir>"; return 1 }
  mkdir -p -- "$1" && cd -- "$1"
}

# `up [N]` — cd up N levels (default 1). `up 3` == `cd ../../..`.
up() {
  local n=${1:-1} p=
  while (( n-- > 0 )); do p+='../'; done
  cd -- "${p:-./}"
}

# `cdr` — cd to git repo root.
cdr() {
  local root
  root=$(git rev-parse --show-toplevel 2>/dev/null) || {
    print -u2 "cdr: not in a git repo"
    return 1
  }
  cd -- "$root"
}

# `bak <file…>` — copy each to <file>.bak.<timestamp>.
bak() {
  local f stamp
  stamp=$(date +%Y%m%d-%H%M%S)
  for f in "$@"; do
    [[ -e $f || -L $f ]] || { print -u2 "bak: $f: no such file"; continue }
    cp -a -- "$f" "${f}.bak.${stamp}"
  done
}

# `unbak <file>` — restore <file> from its newest .bak.* (current file is bak'd first).
unbak() {
  local base=$1
  [[ -n $base ]] || { print -u2 "usage: unbak <file>"; return 1 }
  local backups=( ${base}.bak.*(Nom) )
  (( ${#backups} )) || { print -u2 "unbak: no backups for $base"; return 1 }
  [[ -e $base || -L $base ]] && bak "$base"
  cp -a -- "$backups[1]" "$base"
  print "unbak: restored $base from ${backups[1]:t}"
}

# `lsbig [N]` — top N largest entries in pwd (default 10), human sizes.
lsbig() {
  du -sh -- *(DN) 2>/dev/null | sort -h | tail -n "${1:-10}"
}

# `recent [N]` — N most recently modified regular files in pwd (default 10).
recent() {
  print -l -- *(.DNom[1,${1:-10}])
}
