eval "$(/opt/homebrew/bin/brew shellenv)"

TERMINAL="ghostty"
BROWSER="firefox"
CATALINA_HOME=~/box/apache-tomcat-10.1.30
CLASSPATH="$CLASSPATH:$CATALINA_HOME/lib/jsp-api.jar:$CATALINA_HOME/lib/servlet-api.jar"
PATH="$PATH:/opt/homebrew/opt/llvm@20/bin"
PATH="$PATH:$HOME/box/Odin"
PATH="$PATH:$HOME/box/zig/build/stage3/bin"
PATH="$PATH:$HOME/box/nasm-2.16.03-macosx/nasm-2.16.03/"
PATH="$PATH:$HOME/.docker/bin"
PATH="$PATH:$HOME/dev/roulette/bin"
PATH="$PATH:$HOME/dev/fdo/bin"
PATH="$PATH:$HOME/box/4coder_stable"

##
# Your previous /Users/enrique/.zprofile file was backed up as /Users/enrique/.zprofile.macports-saved_2025-10-08_at_13:45:05
##

# MacPorts Installer addition on 2025-10-08_at_13:45:05: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

