# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# esconder o user e o host no terminal
PS1="\w\[\e[0m\]$ "

# Allow the user to set the title.
function title {
   PROMPT_COMMAND="echo -ne \"\033]0;$1 (on $HOSTNAME)\007\""
}

title 

# User specific environment
 if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
 then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
 fi
 export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

export PGUSER=user001
export PGPASSWORD=ARIANAGRANDE
export PGDATABASE=postgres

export MYSQL_USER=user001
export MYSQL_PASSWORD=ARIANAGRANDE
export MYSQL_HOST=localhost

alias mysql="mysql -u user001 -p'ARIANAGRANDE'"

alias dark="gsettings set org.gnome.desktop.interface color-scheme prefer-dark && gsettings set org.gnome.desktop.interface gtk-theme prefer-dark && COLOR_SCHEME=habamax"
alias light="gsettings set org.gnome.desktop.interface color-scheme prefer-light && gsettings set org.gnome.desktop.interface gtk-theme prefer-light && COLOR_SCHEME=delek"

PS1="[$USER@$HOSTNAME \W]\\$ "

