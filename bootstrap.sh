#!/bin/bash
set -euo pipefail

/usr/bin/curl -fsSL https://artifactory.global.square/artifactory/devenv/bootstrap/sq-bootstrap | /bin/bash -l

bundlefile=$(mktemp)
trap 'rm $bundlefile' EXIT
cat > "$bundlefile" <<-EOF
	tap 'homebrew/cask'
	tap 'homebrew/cask-drivers'
	tap 'homebrew/services'
	tap 'square/formula', 'org-49461806@github.com:squareup/homebrew-formulas.git'

	brew 'aws-iam-authenticator' # if we don't, sqm will
	brew 'awscli'
	brew 'fd'
	brew 'gh'
	brew 'git'
	brew 'git-absorb'
	brew 'jq'
	brew 'k9s'
	brew 'kubectl'
	brew 'mas'
	brew 'rg'
  brew 'just'
  brew 'node'
  brew 'mysql'
	brew 'square/formula/aws-creds'
	brew 'square/formula/beyond-curl'
	brew 'square/formula/hermit'
	brew 'square/formula/polyrepo'
	brew 'square/formula/presidio'
	brew 'square/formula/sqm'
	brew 'square/formula/square-ssh-config'
  brew 'bottom'
  brew 'curl'
  brew 'fzf'
  brew 'kotlin'
  brew 'lsd'
  brew 'neovim'
  brew 'parallel'
  brew 'shellcheck'
  brew 'starship'
  brew 'terraform'
  brew 'tmux'
  brew 'tree-sitter'
  brew 'w3m'
  brew 'watch'
  brew 'wget'
  brew 'xsv'
  brew 'zoxide'
  brew 'pyenv'

	cask 'jetbrains-toolbox'
	cask 'tuple'
  cask 'rectangle'
	cask 'docker'
	cask 'google-cloud-sdk'
	cask 'meetingbar'

EOF
brew bundle install --cleanup --file="$bundlefile"

(source "$(brew --caskroom google-cloud-sdk)/latest/google-cloud-sdk/path.bash.inc" && gcloud components update --quiet)
polyrepo update # TODO: why does polyrepo always update?
sqm update
aws-creds sync
