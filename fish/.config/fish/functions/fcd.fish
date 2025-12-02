function fcd -d "Fuzzy change directory"
    if set -q argv[1]
        set searchdir $argv[1]
    else
        # set searchdir $HOME
        set searchdir .
    end

    if command -q fd
        set destdir (fd --type d --hidden --exclude .git | fzf --height 50%)
    else
        # https://github.com/fish-shell/fish-shell/issues/1362
        set -l tmpfile (mktemp)
        find $searchdir \( ! -regex '.*/\..*' \) ! -name __pycache__ -type d | fzf --height 50% >$tmpfile
        set -l destdir (cat $tmpfile)
        rm -f $tmpfile
    end

    if test -z "$destdir"
        return 1
    end

    cd $destdir
end
