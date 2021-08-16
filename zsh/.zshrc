export NVM_DIR="$HOME/.nvm"
 # This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"
autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%T%-%{$fg[red]%}]%{$reset_color%}$%b "
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%T %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

#function list
tq() curl wttr.in/$1
fy() {
    word=`echo $1 | tr -d '\n' | xxd -plain | sed 's/\(..\)/%\1/g'`
    result=$(curl -s "http://fanyi.youdao.com/openapi.do?keyfrom=CoderVar&key=802458398&type=data&doctype=json&version=1.1&q=$word")
    echo "\033[31m【检索】:\033[0m\c"
    echo  $result | awk -F 'query":' '{print $(2)}' | awk -F ',' '{print $1}'
    echo "\033[33m【释义】:\033[0m\c"
    echo  $result | awk -F ':' '{print $(2)}' | awk -F ',' '{print $1}'
    echo "\033[36m【说明】:\033[0m\c"
    echo  $result | awk -F 'explains":' '{print $(2)}' | awk -F '}' '{print $1}'

    if test '-s' = $2; then
        say $(echo $result | awk -F ':' '{print $(2)}' | awk -F ',' '{print $1}');
    fi
}





# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# map key history
bindkey '^n' history-substring-search-up
bindkey '^p' history-substring-search-down


# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

 #Use lf to switch directories and bind it to ctrl-o
#lfcd () {
	#tmp="$(mktemp)"
	#lf -last-dir-path="$tmp" "$@"
	#if [ -f "$tmp" ]; then
		#dir="$(cat "$tmp")"
		#rm -f "$tmp"
		#[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	#fi
#}
#bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
#export ZSH="/home/vac/.oh-my-zsh"

#ZSH_THEME="cloud"
#plugins=(git zsh-autosuggestions zsh-syntax-highlighting )
#source $ZSH/oh-my-zsh.sh

# Load zsh-syntax-highlighting; should be last.
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
source $HOME/.config/zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh 2>/dev/null
source $HOME/.config/zsh/plugins/history-substring-search/history-substring-search.zsh 2>/dev/null




