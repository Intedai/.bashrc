# INTEDAI START

start() {
    if [ $# -ne 1 ]; then
        echo "Usage: start <directory>" >&2
        return 1
    fi

    if [ -f "$1" ]; then
        echo "$1 is not a directory" >&2
        return 1
    fi

    if [ ! -d "$1" ]; then
        echo "$1 does not exist" >&2
        return 1
    fi
    
    (gnome-terminal --working-directory="$(realpath "$1")" &)
}

venv() {
    if [ $# -ne 1 ]; then
        echo "Usage: venv <directory>" >&2
        return 1
    fi

    if [ -f "$1" ]; then
        echo "$1 is not a directory" >&2
        return 1
    fi

    if [ ! -d "$1" ]; then
        echo "Creating $1..."
        python3 -m venv "$1"
    fi

    source "$1/bin/activate"
}

ghclone() {
    if [ $# -ne 2 ]; then
        echo "Usage: ghclone <username> <repo>" >&2
        return 1
    fi
    
    git clone "git@github.com:$1/$2.git"
}

# INTEDAI END
