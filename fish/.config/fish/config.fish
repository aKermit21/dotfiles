if status is-interactive
    # Commands to run in interactive sessions can go here

    # Function/Alias
    function du10
        du -h $argv | sort -hr | head -10
    end

    function sdu10
        sudo du -h $argv | sort -hr | head -10
    end

    set fish_color_command white --bold

    ### Abbreviations ###
    abbr --add e exit
    abbr --add z zellij
    abbr --add ze zellij
    # bash without fallback to fish
    abbr --add ba bash -norc
    # firewall
    abbr --add fstate systemctl status firewalld.service
    abbr --add fstart sudo systemctl enable --now firewalld.service
    abbr --add fstop sudo systemctl stop firewalld.service
    abbr --add ls eza
    abbr --add ll eza -la
    abbr --add lr eza --recurse --level=2
    abbr --add c. cd ~/.config/
    abbr --add cl cd ~/Documents/latex/Pasozyt
    abbr --add ch cd ~/Documents/HTML
    abbr --add cc cd ~/CppProjects/fraktale/src
    abbr --add mc meson compile
    abbr --add mcc meson compile --clean
    abbr --add mco meson configure
    abbr --add mcon meson configure
    abbr --add bdev cd build-mes-dev
    abbr --add brel cd build-mes-release
    abbr --add mj make -j6
    abbr --add df df -h
    # Set secret token(s)
    abbr --add sunrise source ~/.sunrise.fish
    abbr --add push-frac git push https://$GHTOKEN@github.com/aKermit21/fractal-anim.git
    ### PGP
    abbr --add pgpl 'gpg --list-keys'
    abbr --add aptlist 'apt list --installed | less'
    abbr --add apt-list 'apt list --installed | less'
    abbr --add shutnow sudo shutdown now
    # Xorg or Wayland
    abbr --add xw echo $XDG_SESSION_TYPE
    abbr --add xd echo $XDG_SESSION_TYPE
    # Terminal history
    abbr --add th 'commandline (history search | fzf)'

    # zoxide (smart cd) will be called by 'zo' as 'z' is already used by zellij
    zoxide init fish --cmd zo | source

end

# Copy latex, notes sources and var configs to HDD
# Moved to functions subdirectory
# function docHDD
# end

# Copy thunderbird mail archive to HDD
function mailHDD
    echo "Updating mail archive to HDD:"
    echo ""
    cp -vrpu ~/.thunderbird/ /media/hdd-data/alldata/Robert/Database/GMail/
end

function prety
    echo git log -$argv --pretty=oneline
    git log -$argv --pretty=oneline
end

# Initialize OnlyKey GPG (HW stored keys)
function onlykey_gpg_myinit
    echo "Initialize GPG - OnlyKey HW stored key"
    onlykey-gpg init "Robert Gajewski <robert.gajewski@protonmail.com>" -sk ECC2 -dk ECC1 -i $HOME/Database/publickey.robert.gajewski.protonmail.adjusted.asc
end

set --export GNUPGHOME $HOME/.gnupg/onlykey

set --export JAVA_HOME /usr
