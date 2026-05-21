# dot-expand — type `...` and watch it inline-expand to `../..`, `....` → `../../..`, etc.
# Expansion happens in the buffer so you can see (and edit) the path before pressing Enter.

_dot_expand() {
  if [[ $LBUFFER == *.. ]]; then
    LBUFFER+='/..'
  else
    LBUFFER+='.'
  fi
}
zle -N _dot_expand
bindkey '.' _dot_expand
