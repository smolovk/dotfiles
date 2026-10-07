. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
# ~/.zshenv is sourced by EVERY zsh, `zsh -c` included, and sourcing nvm.sh
# costs ~390ms each time (nvim's system() calls paid it, so did every script).
# Put the default node on PATH by glob (no fork) and defer nvm.sh until the
# `nvm` command is actually used.
if [[ -s $NVM_DIR/nvm.sh ]]; then
	[[ -r $NVM_DIR/alias/default ]] && _nvm_want=$(<$NVM_DIR/alias/default)
	_nvm_bin=(
		$NVM_DIR/versions/node/v${_nvm_want#v}*/bin(N/On)
		$NVM_DIR/versions/node/*/bin(N/On)
	)
	(( $#_nvm_bin )) && path=($_nvm_bin[1] $path)
	unset _nvm_want _nvm_bin

	nvm() {
		unfunction nvm
		. $NVM_DIR/nvm.sh
		[[ -s $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
		nvm "$@"
	}
fi
