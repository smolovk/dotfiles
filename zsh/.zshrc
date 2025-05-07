export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
alias jsinit="npm-init-analog"
alias cat='bat -pp --theme=Nord'
alias la='ls -a'


alias myip="curl ifconfig.me;echo"
