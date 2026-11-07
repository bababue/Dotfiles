# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Bootstrap zinit
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Bootstrap Tmux Plugin Manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    "$HOME/.tmux/plugins/tpm/bin/install_plugins"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

#Install starship zsh prompt
eval "$(starship init zsh)"


#Mac or Linux specific commands
case `uname` in
  Darwin) #Mac-only commands
    #sudo with TouchID
    if ! grep -q "pam_tid.so" "/etc/pam.d/sudo"; then
        echo "Passwort um TouchID zu akivieren"
        sudo sed -i '' '3i\
    auth       sufficient     pam_tid.so
    ' "/etc/pam.d/sudo"
        echo "Touch ID wurde in /etc/pam.d/sudo eingefügt."
    fi
    
    #Add homebrew to shell
    eval "$(/opt/homebrew/bin/brew shellenv)"


    #Add homebrew java to path if installed
    if command -v java &> /dev/null; then
      export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    fi

    #Node Version manager
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


    #Launch tmux only in Ghostty
    if [[ $- == *i* ]]; then
      # check that the terminal is Ghostty
      if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
        if [ -z "$TMUX" ] && command -v tmux >/dev/null 2>&1; then
          tmux attach -t main || tmux new -s main
        fi
      fi
    fi

  ;;
  Linux) #Linux-only commands
      alias kassenbon="(cd /home/bababue/kassenbon/ && source .venv/bin/activate && pip install -r requirements.txt --quiet && python main.py)"
  ;;
esac

if [ -n "$WSLENV" ]; then # WSL-only commands
    alias ssh='ssh.exe'
    alias ssh-add='ssh-add.exe'
    git config --global core.sshCommand ssh.exe
fi

#ZSH Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -Uz compinit && compinit #Atomatically load completions

#ZSH history settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# FZF Shell integrations
eval "$(fzf --zsh)"

#Add GO to path (if it is installed)
if command -v go &> /dev/null; then
  export PATH="$HOME/go/bin:$PATH"
fi


export LEDGER_FILE="~/finances/journals/main.journal"

alias gs='git status'
alias gl='git log --oneline'
alias gc='git commit -m'

alias gca='git commit -a -m'
alias ga='git add'
alias gd='git diff'
alias gp='git pull'
gupload() {
  if (( $# == 0 )); then
    echo "Bitte eine Commit-Nachricht angeben."
    return 1
  fi
  git add . && git commit -m "$*" && git push origin master
}


alias hla="hledger add"
alias hlb="hledger balancesheet --cost --tree"
alias hli="hledger incomestatement --tree"
alias hlw="hledger-web --serve"
alias hlt="hledger-textual"
alias hle="nvim $LEDGER_FILE"
alias ta="tmux attach"

alias v=nvim
alias ts=trash
alias ..="cd .."
alias ...="cd ../.."
alias c="clear"

alias ls='eza'
alias la='eza -lahg'
alias grep="rg"
alias cat="bat"
alias man="man -P bat"
eval "$(zoxide init zsh)"
alias cd='z'

alias c_nvim="(cd ~/.config/nvim/lua/bababue ; nvim .)"
alias c_zsh="(cd ; nvim ~/.zshrc)"
alias c_tmux="(cd ; nvim ~/.tmux.conf)"
alias c_ghostty="(cd ~/.config/ghostty/ ; nvim config)"
alias claude='SHELL=/bin/bash claude'

alias l_zsh="(source $HOME/.zshrc)"

whatsmyip() {
  local local_ip interface

  case "$(uname -s)" in
    Darwin)
      interface=$(route -n get default 2>/dev/null | awk '/interface:/{print $2; exit}')
      [[ -n $interface ]] && local_ip=$(ifconfig "$interface" 2>/dev/null | awk '$1 == "inet" {print $2; exit}')
      ;;
    Linux)
      local_ip=$(ip -4 route get 1.1.1.1 2>/dev/null | awk '{for (i = 1; i <= NF; i++) if ($i == "src") {print $(i + 1); exit}}')
      ;;
  esac

  printf 'Local IP: %s\n' "${local_ip:-unavailable}"
  printf 'Public IP: '
  curl http://ipecho.net/plain
  printf '\n'
}
alias dlv='yt-dlp -S "ext" -S "height:1080"'
alias dla="yt-dlp --extract-audio --audio-format mp3"

alias vnew='python3 -m venv .venv && source .venv/bin/activate && whereis python'
alias vinstall='pip install -r requirements.txt'
alias vactivate='source .venv/bin/activate'
alias pwf='readlink -f '


export EDITOR=nvim
export VISUAL=nvim

