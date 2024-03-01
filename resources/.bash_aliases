route_to_prog_stud() {
    if [ -d "/mnt/e/Drive Gabryel/DRIVE/GAB/Estudos-Trabalhos/PROGRAMAÇÃO/programming-studies/" ]; then
        cd /mnt/e/Drive\ Gabryel/DRIVE/GAB/Estudos-Trabalhos/PROGRAMAÇÃO/programming-studies/
    elif [ -d "/mnt/g/O meu disco/DRIVE/GAB/Estudos-Trabalhos/PROGRAMAÇÃO/programming-studies" ]; then
        echo "First dict not found. Trying the alternative path..."
        cd /mnt/g/O\ meu\ disco/DRIVE/GAB/Estudos-Trabalhos/PROGRAMAÇÃO/programming-studies/
    else
        echo "Second dict not found. Trying looking in home directory..."
        cd $HOME/programming-studies/
    fi
}
alias programming-studies='route_to_prog_stud'

# GIT
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gc='git checkout'
alias gp='git push'
alias gpl='git pull'
alias dotcommit="git add . && git commit -m '.'"


# NAVIGATION
alias ..='cd ..' # replace with zoxide?

# FILES
alias ll='ls -al'

# LANGUAGES
alias py="python3"
alias python="python3"
## Python (3.11)
# export PATH=$PATH:/usr/bin/python3.11
## Go
# export PATH=$PATH:/usr/local/go/bin
# export PATH=$PATH:$HOME/seete/go/bin
