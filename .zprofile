eval "$(/opt/homebrew/bin/brew shellenv)"

TERMINAL="ghostty"
BROWSER="firefox"
CATALINA_HOME=~/box/apache-tomcat-10.1.30
CLASSPATH="$CLASSPATH:$CATALINA_HOME/lib/jsp-api.jar:$CATALINA_HOME/lib/servlet-api.jar"
PATH="$PATH:/opt/homebrew/opt/llvm@20/bin"
PATH="$PATH:$HOME/box/Odin"
PATH="$PATH:$HOME/box/zig/build/stage3/bin"
PATH="$PATH:$HOME/box/nasm-2.16.03-macosx/nasm-2.16.03/"

