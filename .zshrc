# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lfendy/Downloads/gcloudsdk/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lfendy/Downloads/gcloudsdk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lfendy/Downloads/gcloudsdk/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lfendy/Downloads/gcloudsdk/google-cloud-sdk/completion.zsh.inc'; fi

alias ccc="clear && tmux clear-history"


alias k=kubectl
source <(kubectl completion zsh)
source <(kubectl completion zsh | sed 's/kubectl/k/g' )

# trailing tim watch
function twatch() {
  while : ; do echo `date; $*` ; sleep 10; done
}


eval "$(pyenv init -)"

export PS1='${SSH_CONNECTION+"%{$fg_bold[cyan]%}%n@%m:"}%{$fg_bold[green]%}%1d%{$reset_color%}$(git_prompt_info):%? '

##### fzf stuff


FZF_CTRL_R_OPTS='--preview-window=up:10:wrap --preview="echo \"{}\"" --height 100%'

__fzfcmd() {
  [ -n "$TMUX_PANE" ] && { [ "${FZF_TMUX:-0}" != 0 ] || [ -n "$FZF_TMUX_OPTS" ]; } &&
    echo "fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- " || echo "fzf"
}

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

export HISTFILE=~/.zhistory   # History savefile location
export HISTSIZE=1000000       # Number of history items to save in memory
export SAVEHIST=1000000       # Number of history items to save in file
setopt APPEND_HISTORY         # multiple sessions append to same history file (rather than last)
setopt INC_APPEND_HISTORY     # add history items immediately, not when the session exits

fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\s+(.*)/, $1)}++' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget

export EDITOR=vim

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


