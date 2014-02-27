###
# generic functionality
#######################

GREEN="\033[01;32m"
YELLOW="\033[01;33m"
RED="\033[01;31m"
BLUE="\033[01;34m"
NONE="\033[00m"

colorize() {
    local FIRST="$1"
    shift
    echo -e "$SPACES${COLOR}$FIRST${NONE}$*"
}

success() {
    local COLOR="$GREEN"
    colorize "$@"
}

warn() {
    local COLOR="$YELLOW"
    colorize "$@"
}

error() {
    local COLOR="$RED"
    colorize "$@"
    return 1
}

inform() {
    local COLOR="$RED"
    colorize "$@"
    return 1
}

report_on_error() {
    if [ "$DEBUG" ]; then
        "$@"
        return
    fi
    OUTPUT="$("$@" 2>&1)"
    if [ $? -ne 0 ]; then
        error "Failed command: " 
        for i in "$@"; do
            (
                set -- $i
                [ "$2" ]
            )
            if [ $? -eq 0 ]; then
                echo -n "'$i' "
            else
                echo -n "$i "
            fi
        done
        echo
        echo "$OUTPUT"
        false
    fi
}