# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "Aloxaf/fzf-tab"
plug "romkatv/powerlevel10k"

#alias
alias nv='nvim'
alias p='python'
alias get_idf='. $HOME/documents/programming/c/esp/esp-idf/export.sh'
alias cl='clear'
alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'

source /usr/share/fzf/shell/key-bindings.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

clear-scrollback-and-screen () {
  zle clear-screen
}
zle -N clear-scrollback-and-screen
# bindkey -M vicmd "^x" clear-scrollback-and-screen
# bindkey "^x" clear-scrollback-and-screen

tmux-sess () {
  tmux-sessionizer
}
zle -N tmux-sess
bindkey -M vicmd "^f" tmux-sess
bindkey "^f" tmux-sess

tldr-s () {
    tldr-search.sh
    zle reset-prompt
}

zle -N tldr-s
bindkey -M vicmd "^t" tldr-s
bindkey "^t" tldr-s
