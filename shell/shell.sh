echo "Loading shell configurations..."
# Used by other configurations to determine the dotfiles directory
export DF_DIR="$HOME/.dotfiles"
rc_dir="$DF_DIR/shell"

# Shell configuration
export CLICOLOR=1
set -o vi	# vi keybinds to shell
export KEYTIMEOUT=1 # Reduce key timeout for vi mode

# Bookmarks
export Mk="$HOME/.mk"
export mk="$HOME/.mk"

# Third party tools
echo "Setting up NVM..."    # Usually the most time-consuming step
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
echo "Done."

# Autostart tmux
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi

test -f $rc_dir/git-prompt.sh && . $_

# Personal tools
export PATH="$HOME/scripts/extra:$HOME/scripts:$PATH"
[ -s "$rc_dir/alias.sh" ] && \. "$rc_dir/alias.sh"
[ -s "$rc_dir/commands.sh" ] && \. "$rc_dir/commands.sh"
[ -s "$rc_dir/bookmarks.sh" ] && \. "$rc_dir/bookmarks.sh"
[ -s "$rc_dir/extraconf.sh" ] && \. "$rc_dir/extraconf.sh"

