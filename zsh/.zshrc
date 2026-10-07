export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
alias jsinit="npm-init-analog"
#alias cat='bat -pp --theme=Nord'
alias la='ls -a'
alias ll='ls -l'
alias l='ls'


alias myip="curl ifconfig.me;echo"

export PATH=$PATH:/opt/nvim-linux-x86_64/bin

# nvm is set up lazily in ~/.zshenv (sourcing nvm.sh here cost another ~460ms)


# Colors (ANSI)
C1=$'\e[38;5;81m'   # blue-ish
C2=$'\e[38;5;39m'   # cyan-ish
GREY=$'\e[90m'
RST=$'\e[0m'

center() {
	local text="$1"
	local cols
	cols=$(tput cols 2>/dev/null || echo 80)
	local pad=$(( (cols - ${#text}) / 2 ))
	(( pad < 0 )) && pad=0
	printf "%*s%s\n" "$pad" "" "$text"
}

echo ""

# greeting
center "${C1}hi, ${USER}${RST}"
echo ""

# block header
center "${GREY}-------------------------${RST}"
if [[ -S /var/run/docker.sock ]]; then
	center "${C2}  - docker up${RST}"
else
	center "${GREY}  - docker down${RST}"
fi
center "${GREY}-------------------------${RST}"
echo ""

# info lines (aligned as simple text, but visually centered as a group)
center "${GREY}host:${RST}   $(hostname)"
center "${GREY}date:${RST}   $(date '+%Y-%m-%d %H:%M:%S')"
center "${GREY}uptime:${RST} $(uptime -p)"
center "${GREY}load:${RST}   $(cut -d ' ' -f1-3 /proc/loadavg)"

echo ""
export PATH=$PATH:/usr/local/go/bin:/opt/bin

export PATH="$HOME/.local/bin:$PATH"
export PICO_SDK_PATH=/home/smolovk/pico-sdk
export GTK_THEME=Adwaita:dark

# ~/org WebDAV mount: systemctl --user status rclone-org


# bun completions
[ -s "/home/smolovk/.bun/_bun" ] && source "/home/smolovk/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias claude-mem='/home/smolovk/.bun/bin/bun "/home/smolovk/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'

# If not inside a tmux session, and if it's an SSH connection...
if [ -z "$TMUX" ] && [ -n "$SSH_CLIENT" ]; then
    # Try to attach to a session named 'dev', or create it if it doesn't exist
    tmux attach-session -t dev || tmux new-session -s dev
fi

# Local secrets and overrides
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# opencode
export PATH=/home/smolovk/.opencode/bin:$PATH

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

alias tw="task"
alias ts="task sync"
alias twy="task end.after:yesterday end.before:today completed"

# Claude Code with skip-permissions + Telegram channel
alias cc="claude --dangerously-skip-permissions"


# Added by Antigravity CLI installer
export PATH="/home/smolovk/.local/bin:$PATH"
