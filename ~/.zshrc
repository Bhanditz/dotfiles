autoload -U colors && colors
fpath=( $fpath ~/.zsh/completion )
autoload -U compinit && compinit
autoload -U vcs_info && vcs_info
autoload -U edit-command-line && zle -N edit-command-line \
	&& bindkey -M vicmd v edit-command-line

zmodload zsh/complist
zmodload zsh/terminfo

bindkey -v

if [ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
	source $HOME/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

for r in $HOME/.zsh/*.zsh; do
        if [[ $DEBUG > 0 ]]; then
                echo "zsh: sourcing $r"
        fi
        source $r
done
umask 077
eval $( dircolors -b $HOME/.zsh/LS_COLORS )
