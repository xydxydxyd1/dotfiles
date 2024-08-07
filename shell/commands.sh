# Custom commands

# List directory and git status after cd
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
