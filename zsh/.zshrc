export NVM_DIR="$HOME/.nvm"
 # This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"
[ -f "$HOME/.config/zsh/completion.zsh" ] && source "$HOME/.config/zsh/completion.zsh"

#export FZF_DEFAULT_OPTS='--bind=ctrl-t:top,change:top --bind ctrl-e:down,ctrl-u:up'
export FZF_DEFAULT_OPTS='--bind ctrl-n:down,ctrl-p:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
#export FZF_DEFAULT_COMMAND='fd'
export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'
export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'




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

zle -N  history-substring-search-up
bindkey '^N' history-substring-search-up
zle -N  history-substring-search-down
bindkey '^P' history-substring-search-down


# vi mode
#zle -N edit-command-line
#bindkey '^v' edit-command-line
bindkey -v
export KEYTIMEOUT=1
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey -M vicmd "K" vi-beginning-of-line
bindkey -M vicmd "J" vi-end-of-line

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

#Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


### Added by Zinit's installer
if [[ ! -f $HOME/.config/zsh/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.config/zsh/.zinit" && command chmod g-rwX "$HOME/.config/zsh/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.config/zsh/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.config/zsh/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light ael-code/zsh-colored-man-pages
zinit light zsh-users/zsh-history-substring-search

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node
### End of Zinit's installer chunk




#_fzf_fpath=${0:h}/fzf
#fpath+=$_fzf_fpath
#autoload -U $_fzf_fpath/*(.:t)
#unset _fzf_fpath

#fzf-redraw-prompt() {
	#local precmd
	#for precmd in $precmd_functions; do
		#$precmd
	#done
	#zle reset-prompt
#}
#zle -N fzf-redraw-prompt

#zle -N fzf-find-widget
#bindkey '^p' fzf-find-widget

#fzf-cd-widget() {
	#local tokens=(${(z)LBUFFER})
	#if (( $#tokens <= 1 )); then
		#zle fzf-find-widget 'only_dir'
		#if [[ -d $LBUFFER ]]; then
			#cd $LBUFFER
			#local ret=$?
			#LBUFFER=
			#zle fzf-redraw-prompt
			#return $ret
		#fi
	#fi
#}
#zle -N fzf-cd-widget
#bindkey '^t' fzf-cd-widget

#fzf-history-widget() {
	#local num=$(fhistory $LBUFFER)
	#local ret=$?
	#if [[ -n $num ]]; then
		#zle vi-fetch-history -n $num
	#fi
	#zle reset-prompt
	#return $ret
#}
#zle -N fzf-history-widget
#bindkey '^R' fzf-history-widget

#fif() {
  #if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  #rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
#}

#find-in-file() {
	#grep --line-buffered --color=never -r "" * | fzf
#}
#zle -N find-in-file
#bindkey '^f' find-in-file

