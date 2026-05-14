# .bashrc - common config tracked in git
# Machine-specific config goes in ~/.bash_local (not tracked in git)

set -o vi

# Add git branch if its present to PS1
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

alias rm='trash'

if [[ "$TERM_PROGRAM" == ghostty ]] || [[ "$TERM" == "xterm-ghostty" ]]; then
  alias vim='nvim'
fi

# Load machine-specific config (work/personal) - not tracked in git
[ -f ~/.bash_local ] && source ~/.bash_local
