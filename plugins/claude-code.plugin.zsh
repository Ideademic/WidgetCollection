# claude-code — short aliases for the Claude Code CLI.

alias cl='claude'
alias clc='claude --continue'
alias clr='claude --resume'
alias clrm='claude remote-control'
alias clrmi='claude --remote-control'
alias cldanger='claude --allow-dangerously-skip-permissions'

cllms() {
  ANTHROPIC_BASE_URL=http://localhost:1234 ANTHROPIC_AUTH_TOKEN=lmstudio claude "$@"
}
