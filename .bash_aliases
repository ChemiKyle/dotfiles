# Add the following to ~/.bashrc
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

# don't show duplicates when traversing bash history
export HISTCONTROL=ignoredups


# MacOS overrides #############################################################

# add the following to ~/.bash_profile
# if [ -f ~/.bashrc ]; then
#     . ~/.bashrc
# fi

if [ $(uname -s) == "Darwin" ]; then

    # Give me GNU
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"

    # Force aliases for non "coreutil" GNU binaries
    alias grep="ggrep"
    alias sed="gsed"
    alias tar="gtar"

    export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH"
    # show GNU man pages
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

    # don't bother me about zsh
    export BASH_SILENCE_DEPRECATION_WARNING=1

    # brew can update when I tell it it can, like every other package manager
    export HOMEBREW_NO_AUTO_UPDATE=1

fi


# Prompt line #################################################################

# for codes, see https://superuser.com/questions/263040/mac-terminal-remove-text-prefixing-dollar-sign/263042

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


# Docker ######################################################################

# list ids of all untagged images
alias dui="docker image ls -a | grep \"^<none>\" | awk '{ print \$3 }'"

alias dc="docker-compose"

# "ssh" into running docker container
# e.g. dssh rc1051_web
dssh() {
    docker exec -it $1 bash
}


# Misc ########################################################################

alias ls='ls --color'

# first run the following:
# git config --global alias.root "rev-parse --show-toplevel"
alias cdg='git rev-parse && cd "$(git rev-parse --show-cdup)"'

alias grep='grep --exclude-dir=.git'

cp_last_download() {
    LAST_FILE=`ls -tr ~/Downloads/ | tail -1`
    echo "Copying $LAST_FILE to $1"
    cp ~/Downloads/"$LAST_FILE" $1
}
mv_last_download() {
    LAST_FILE=`ls -tr ~/Downloads/ | tail -1`
    echo "Moving $LAST_FILE to $1"
    mv ~/Downloads/"$LAST_FILE" $1
}

mv_screenshot() {
    LAST_FILE=`ls -tr ~/Desktop/ | tail -1`
    echo "Moving $LAST_FILE to $1"
    mv ~/Desktop/"$LAST_FILE" $1
}

f() {
    # shorthand for a local find
    find . -iname $1
}

# YYYMMDDTHMS
alias dts="date +%Y%m%dT%H%M%S"

git-clean() {
    # https://stackoverflow.com/a/6127884/7418735
    git branch --merged | egrep -v "(^\*|master|main|develop)" | xargs git branch -d
}

alias mpd="mpd ~/.config/mpd/mpd.conf"

gitreport() {
    # https://stackoverflow.com/a/72110244/7418735
    git log --format='%aN' |
        sort -u |
        while read name; do
            echo -en "$name\t";
            git log --author="$name" --pretty=tformat: --numstat |
                awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -;
        done
}
