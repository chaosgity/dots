#
# ~/.bashrc
#

# ADDED VIA ANSIBLE NEW

# VI-MODE
set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# VIVID COLOR SETTING
export LS_COLORS="$(vivid -m 8-bit generate catppuccin-macchiato)"

# CATPPUCCIN-FZF-MACCHIATO

export FZF_DEFAULT_COMMAND="fd --strip-cwd-prefix --color=always --hidden --follow --exclude .git"
export FZF_CTRL_T_COOMAND="FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --strip-cwd-prefix --color=always --hidden --follow --exclude .git"


export FZF_DEFAULT_OPTS=" \
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"

export FZF_DEFAULT_OPTS="--ansi"

_fzf_compgen_path() {
	fd --type f --color=always --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
        fd --type d --color=always --hidden --follow --exclude ".git" . "$1"
#  zoxide query -1 $1
}

export BAT_THEME="Catppuccin Macchiato"

. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash

bind -x '"\C-w":__fzf_history__'

# ZOXIDE
eval "$(zoxide init bash)"

clocate() { locate --regex "$1" | grep --color=auto "$1"; }

#export FZF_TMUX_OPTS="-P"

# HISTORY SETTING
HISTSIZE=10000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignorespace:ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


# OUTSOURCING DIRECTORY FOR FUNCTIONS
# SHOULD BE SET AT THE BOTTOM OF THIS FILE
fn_dir=~/.bash_functions
if [ -d "$fn_dir" ]; then
    for file in "$fn_dir"/*; do
        [ -r "$file" ] && . "$file"
    done
fi

# OUTSOURCING FILE FOR ALIASES
# SHOULD BE SET AT THE BOTTOM OF THIS FILE
if [ -f ~/.aliases ]; then
        . ~/.aliases
fi

