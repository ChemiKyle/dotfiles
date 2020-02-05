# Personal Config
Git repo to host configs, dotfiles, etc.
Files in the root of this directory are considered OS agnostic. To implement these should be as simple as:
```bash
cp -r . ~/.
```
Note that a symlink may be necessary for [Vim](.vim/.vimrc)

OS specific config files are under a folder with their respective name.
