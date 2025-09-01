#!/usr/bin/env bash

# WARNING this script doesn't work.
# This script was created to make autocomplete work when writing homebrew packages. while it successfully detects homebrew's ruby installation, it does not import homebrew ruby code

set -x
export HOMEBREW_LIBRARY="/opt/homebrew/Library"
export HOMEBREW_DEVELOPER=1
export HOMEBREW_BREW_FILE=/opt/homebrew/bin/brew
source "${HOMEBREW_LIBRARY}/Homebrew/cmd/setup-ruby.sh"
homebrew-setup-ruby

# unset: GEM_PATH, BUNDLE_BIN
echo "
GEM_HOME=${GEM_HOME}
BUNDLE_GEMFILE=${BUNDLE_GEMFILE}
HOMEBREW_RUBY_PATH=${HOMEBREW_RUBY_PATH}
"

export PATH="/opt/homebrew/Library/Homebrew/vendor/portable-ruby/current/bin:$PATH"
