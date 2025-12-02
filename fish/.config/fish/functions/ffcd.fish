function ffcd -d "Fuzzy change to the directory containning file"
    # function fzf_cd_to_file
    echo "Chnage to the directory containing selected file (with fzf)"
    # Find files using fd (faster alternative to find) or fall back to find
    if command -q fd
        set file (fd --type f --hidden --exclude .git | fzf --height 50%)
    else
        # set file (find . -type f 2>/dev/null | fzf --height 40% --reverse)
        set file (find . -type f 2>/dev/null | fzf --height 50%)
    end

    if test -n "$file"
        cd (dirname "$file")
    end
end
