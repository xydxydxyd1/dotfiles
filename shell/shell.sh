echo "Loading shell configurations..."
# Used by other configurations to determine the dotfiles directory
export DF_DIR="$HOME/.dotfiles"
rc_dir="$DF_DIR/shell"

# Shell configuration
export CLICOLOR=1
set -o vi	# vi keybinds to shell
export KEYTIMEOUT=1 # Reduce key timeout for vi mode

# Add custom scripts repository
export PATH="$HOME/scripts/extra:$HOME/scripts:$PATH"

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

[ -s "$rc_dir/alias.sh" ] && \. "$rc_dir/alias.sh"
[ -s "$rc_dir/bookmarks.sh" ] && \. "$rc_dir/bookmarks.sh"
[ -s "$rc_dir/extraconf.sh" ] && \. "$rc_dir/extraconf.sh"

echo "Setting up NVM..."
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Autostart tmux
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi
