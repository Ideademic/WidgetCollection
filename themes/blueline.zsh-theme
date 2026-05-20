setopt PROMPT_SUBST
PROMPT=$'%{\e[104m%}[%2~]%{\e[0m%} ‖→ '

git_prompt() {
  local b=$(command git branch --show-current 2>/dev/null)
  [[ -z $b ]] && return
  local mark=$'%{\e[94m%}✓'
  [[ -n $(command git status --porcelain 2>/dev/null) ]] && mark='✗'
  print -n $'%{\e[34m%}'"$b $mark"$'%{\e[0m%}'
}
RPROMPT='$(git_prompt)'