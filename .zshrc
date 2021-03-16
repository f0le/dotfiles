#Additional PATH
fpath+=$HOME/.zsh/pure
path+=('~/.bin/')
autoload -U promptinit; promptinit

#Pure(prompt) configuration
PURE_CMD_MAX_EXEC_TIME=30

# This will set the default prompt
prompt pure
autoload -Uz compinit && compinit

setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1
#menu autocomplete
zstyle ':completion:*' menu select

#Vim mode
#bindkey -v
export EDITOR=vim
export VISUAL=vim

#History search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

#Aliases
alias ..="cd .."
alias grep="grep --color=auto"
alias ls="ls --color=auto --human-readable --group-directories-first --classify"
alias ll="ls --color=auto --human-readable --group-directories-first --classify -l"
alias lla="ls --color=auto --human-readable --group-directories-first --classify -la"
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias mkdir='mkdir -v'
alias chmod='chmod -c'
alias chown='chown -c'
alias shutdown="shutdown -h now"
alias pin="ping -c 3 192.168.0.1"
alias pi="ping -c 3 www.archlinux.org"
alias tor="tor-browser-en"
alias df="df -hT"
alias tree="tree -C -d --du -h -L 2"
alias siedler2="dosbox /home/trustno1/.Settlers/Siedler2/"
#make this into a script which overwrites with zeros first once
alias shredfile="shred --random-source=/dev/urandom -n 5 -v -z -u"
#show dirs with size
alias du="du -kh --max-depth=1 ./"
#alias cat="cat -n"
#calc with float point arithmetic
alias bc="bc -li"
alias tmux="tmux -2"
alias log="script"

#dircolors setting
eval $(dircolors -p | perl -pe 's/^((CAP|S[ET]|O[TR]|M|E)\w+).*/$1 00/' | dircolors -)

#colorize man pages
man() {
     		env \
    			LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    			LESS_TERMCAP_md=$(printf "\e[1;31m") \
    			LESS_TERMCAP_me=$(printf "\e[0m") \
    			LESS_TERMCAP_se=$(printf "\e[0m") \
    			LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    			LESS_TERMCAP_ue=$(printf "\e[0m") \
    			LESS_TERMCAP_us=$(printf "\e[1;32m") \
    				man "$@"
}

#set to automatically change into directory by typing it
setopt auto_cd autopushd

#start ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
#Add ssh-keys to agent
/usr/bin/ssh-add ~/.ssh/github.com/id_ed25519 &> /dev/null
/usr/bin/ssh-add ~/.ssh/greencare-baumpflege.de/id_ed25519 &> /dev/null
/usr/bin/ssh-add ~/.ssh/folie.dev/id_ed25519 &> /dev/null

#Must be at the end
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
