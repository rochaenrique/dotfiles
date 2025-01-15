eval "$(/opt/homebrew/bin/brew shellenv)"

# Default stuff
export EDITOR="nvim"
export TERMINAL="iterm"
export BROWSER="arc"

# User things
# export ZDOTDIR="$HOME/.config/zsh"

# Tomcat and java stuff
export CATALINA_HOME=~/box/apache-tomcat-10.1.30
export CLASSPATH="$CLASSPATH:$CATALINA_HOME/lib/jsp-api.jar:$CATALINA_HOME/lib/servlet-api.jar"

# source "/Users/enrique/box/emsdk/emsdk_env.sh"
