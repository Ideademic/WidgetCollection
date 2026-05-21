autoload -U add-zsh-hook

_git_rprompt() {
  local b=$(command git branch --show-current 2>/dev/null)
  if [[ -z $b ]]; then
    RPROMPT=''
    return
  fi
  local mark=$'%{\e[94m%}✓'
  [[ -n $(command git status --porcelain 2>/dev/null) ]] && mark='✗'
  RPROMPT=$'%{\e[34m%}'"$b $mark"$'%{\e[0m%}'
}
add-zsh-hook precmd _git_rprompt

PROMPT=$'%{\e[104m%}[%2~]%{\e[0m%} ‖→ '