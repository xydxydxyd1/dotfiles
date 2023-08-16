# Eric's dotfiles #
So I can setup my stuff with a couple commands

# What is included

- [Bookmark system](./bash/bookmarks.sh) for bash
- Miscellaneous bash command aliases
- Various vim configurations (check out [vim](./vim/README.md))
- Other miscellaneous settings such as `.editorconfig`

## Setup ##
- **Put dotfiles (this repository) in home directory**
- make sure there is a `.config` directory in your home directory
- Run [setup.sh](setup.sh) to create symlink at proper places

## Clean up ##
- Run [clean.sh](clean.sh) to reset
    - removes all symlinks
    - removes all vim plugins
