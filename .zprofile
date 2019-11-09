#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='mcedit'
export VISUAL='nano'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
cdpath=(
  ${HOME}/Projects
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  ${HOME}/go/bin
  /opt/local/share/java/android-sdk-macosx/platform-tools
  /Applications/Binary\ Ninja.app/Contents/MacOS/
  ${HOME}/Library/Android/sdk/emulator/
  /Applications/IDA\ Pro\ 7.1/ida.app/Contents/MacOS/
  /opt/metasploit-framework/bin
  /Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool
  /Applications/Genymotion.app/Contents/MacOS
  /Applications/Genymotion\ Shell.app/Contents/MacOS/
  /Applications/Genymotion.app/Contents/MacOS/player.app/Contents/MacOS
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

