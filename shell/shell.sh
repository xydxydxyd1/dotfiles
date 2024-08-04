echo "Loading shell configurations..."
# Used by other configurations to determine the dotfiles directory
export DF_DIR="$HOME/.dotfiles"
rc_dir="$DF_DIR/shell"

####################
#  Configurations  #
####################

export CLICOLOR=1
set -o vi	# vi keybinds to shell
export KEYTIMEOUT=1 # Reduce key timeout for vi mode
export PATH="$HOME/scripts/extra:$HOME/scripts:$PATH"	# Add scripts to PATH

#####################
#  Custom Commands  #
#####################

# Command Modifications
alias ls='ls --color'	# Enable colorized directory list
alias ll='ls -l'	# List directories, but loooong
alias la='ls -a'	# List directories, but also the ~~secrets~~
alias lla='ls -la'	# List directories, but loooong
alias rm='rm -i'	# Always emable removal confirmation prompts
alias ccat='pygmentize -g'  # Colorful cat
alias python='python3'
alias vimdb='\vim -c "packadd termdebug" -c "Termdebug"'
alias open='xdg-open'
alias pvenv='source .venv/bin/activate'
# List directory after cd
cd() {
    # Use -P flag to resolve symlinks to absolute paths; mainly for bookmark system
    builtin cd -P "$@" || return
    git -C $(pwd) rev-parse 2>/dev/null
    if [[ $? -eq 0 ]]; then
        git status
    fi
    ls
}

# Git commands
alias gs='git status'
alias ga='git add'
alias gp='git pull'
alias gps='git push'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'

# Load bookmark system
if [[ -f $rc_dir/bookmarks.sh ]];
then
    source "$rc_dir/bookmarks.sh";
fi;

cdgit()
{
	cd "$(git rev-parse --show-toplevel)" || return
}

pipfreeze()
{
    pip install $1
    pip freeze | grep $1 >> requirements.txt
}

test -f $rc_dir/git-prompt.sh && . $_

if [[ -f $rc_dir/extraconf.sh ]]; then
    source "$rc_dir/extraconf.sh";
fi

# Add nvm to path
echo "Setting up NVM..."
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

"if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
"  exec tmux
"fi

