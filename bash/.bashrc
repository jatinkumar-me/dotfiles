#
# ~/.bashrc
#
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
bind -m vi-insert 'Control-e: alias-expand-line'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

#
# ALIASES ===========================================================
#

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias bashconf='nvim ~/.bashrc'
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -lah'
alias extract='tar -zxvf'
alias reloadrc='source ~/.bashrc'
alias copy='rsync -avh --progress'
alias vimconf='cd ~/.config/nvim && nvim .'
alias touchpad="~/scripts/touchpad-toggle.sh"
alias keys="~/scripts/toggle-internal-kb.sh"
alias vi="vim"
alias blue="bluetoothctl connect E8:07:BF:89:A5:97"
alias remote-android="ssh -p 8022 user@192.168.37.88"
alias sync-photos="pull-android-sync storage/dcim/Camera Files/Pictures/"
alias utube='ytfzf -t'
alias yt-music='yt-dlp -x --embed-thumbnail --audio-format mp3'

push-android-sync() {
    rsync -P -arv -e 'ssh -p 8022' $1 user@$3:$2
}

push-remote-sync() {
    rsync -P -arv $1
}

pull-remote-sync() {
    rsync -P -arv $1
}

pull-android-sync() {
    rsync -P -arv -e 'ssh -p 8022' user@$3:$1 $2
}

mkcd() {
    mkdir -p "$1" && cd "$1"
}

gh-switch() {
    GH_CONFIG_DIR="$HOME/.config/gh"
    HOSTS_YML="$GH_CONFIG_DIR/hosts.yml"
    BACKUP_YML="$GH_CONFIG_DIR/hosts.yml.backup"

    if [ -f "$HOSTS_YML" ] && [ -f "$BACKUP_YML" ]; then
        mv "$HOSTS_YML" "$GH_CONFIG_DIR/hosts.yml.tmp"
        mv "$BACKUP_YML" "$HOSTS_YML"
        mv "$GH_CONFIG_DIR/hosts.yml.tmp" "$BACKUP_YML"
        echo "Switched GitHub accounts."
    else
        echo "Can't switch accounts. GitHub account configuration files not found."
    fi
}

diskusage() {
    if [ $# -eq 0 ]; then
        echo "Usage: diskusage DIRECTORY"
        return 1
    fi

    local directory="$1"
    
    du -cha --max-depth=1 "$directory" | grep -P '\d[MG]'
}

open() {
    FILE_NAME="$1"
    if [ ! -f "$FILE_NAME" ]; then
        echo "File doesn't exist"
        return 1
    fi
    xdg-open "$FILE_NAME" & disown
}

browsr() {
    chromium --new-window --app=$1
}

#
# PROMPT =============================================================
#

eval "$(starship init bash)"

#
# NVM Node version manager============================================
#
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
