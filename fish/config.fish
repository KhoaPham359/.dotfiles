source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
alias cat='bat'
# alias rm='rm -i'
alias mkdir='mkdir -p'
alias cd='z'
alias cdi='zi'
alias rm='trash'
if status is-interactive
    set -g fish_greeting
    #    fastfetch
    # stty -icanon -echo
    # dd bs=1 count=1 >/dev/null 2>&1
    # stty icanon echo
    zoxide init fish | source
    direnv hook fish | source

    function nv
        neovide $argv & disown
    end

    function auto_activate_venv --on-variable PWD
        if test -f .venv/bin/activate.fish
            if not set -q VIRTUAL_ENV
                source .venv/bin/activate.fish
            end
        else if set -q VIRTUAL_ENV
            deactivate
        end
    end
end
function fish_command_not_found
    if type -q yay
        echo "Command '$argv' not found. Searching in packages..."
        pacman -F $argv
    else
        echo "Command '$argv' not found and 'yay' is not installed."
    end
end

fish_add_path /home/soniya/.spicetify
