# zsh-niceties — quality-of-life zsh options that should arguably be on by default.

# Case-insensitive tab completion (`pro<TAB>` matches `Projects/`).
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit && compinit

# Up/Down search history for entries matching what's already typed
# (type `ls`, press Up → only past commands starting with `ls`).
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search   # Up
bindkey '^[[B' down-line-or-beginning-search # Down
bindkey '^[OA' up-line-or-beginning-search   # Up (application mode)
bindkey '^[OB' down-line-or-beginning-search # Down (application mode)

# Type a directory name to cd into it (no `cd` needed).
setopt AUTO_CD

# Every cd pushes onto the dir stack — `cd -<TAB>` lists recent dirs.
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# History: share across sessions, dedupe, write immediately, keep timestamps.
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE        # commands starting with a space aren't saved
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY              # `!!` expansions show on the prompt before running
setopt EXTENDED_HISTORY         # save timestamp + duration per entry
HISTSIZE=50000
SAVEHIST=50000

# Allow `# comments` at the interactive prompt.
setopt INTERACTIVE_COMMENTS

# Extended globbing: `**/*.md`, `^pattern`, `<1-10>`, etc.
setopt EXTENDED_GLOB

# A non-matching glob is left as-is instead of erroring out the whole command.
setopt NO_NOMATCH

# Quiet terminal — no bell on completion errors.
setopt NO_BEEP

# Notify of finished background jobs immediately, not at the next prompt.
setopt NOTIFY

# Numeric-aware glob sort (`file2` before `file10`).
setopt NUMERIC_GLOB_SORT

# Use the first ambiguous tab-completion match's menu instead of just listing.
zstyle ':completion:*' menu select

# Colorize completion listings using the same palette as `ls`.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
