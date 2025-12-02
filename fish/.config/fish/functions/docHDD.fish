# Copy latex, notes sources and var configs to HDD
function docHDD
    # get last digit of day 
    set dayd (math (date "+%d") % 10)
    set gitdir /media/hdd-data/alldata/GIT/
    set gitCppFile $gitdir'CppPrjs_Git_'$dayd'.bundle'
    set gitLatexFile $gitdir'Latex_Git_'$dayd'.bundle'
    set gitHTMLFile $gitdir'HTML_Git_'$dayd'.bundle'
    set gitStowFile $gitdir'dotfiles-stow_Git_'$dayd'.bundle'
    # take current directory and split it for list
    set spwd (string split / (pwd))

    echo "Updating files and notes to HDD:"
    echo ""
    cp -vrpu ~/Documents/notes/* /media/hdd-data/alldata/Robert/notes/
    cp -vrpu ~/Documents/latex/Pasozyt/*.tex /media/hdd-data/alldata/Robert/latex/
    cp -vrpu ~/Documents/latex/Pasozyt/*.md /media/hdd-data/alldata/Robert/latex/
    # copy also hidden files
    #   cp -vrpu ~/Documents/latex/ /media/hdd-data/alldata/Robert/
    cp -vrpu ~/Documents/HTML/* /media/hdd-data/alldata/Robert/HTML/
    cp -vrpu ~/Documents/latex/Pasozyt/*.tex /media/hdd-data/alldata/Robert/backup_dotelefonu/
    cp -vrpu ~/Documents/latex/Pasozyt/*.md /media/hdd-data/alldata/Robert/backup_dotelefonu/
    cp -vrpu ~/Database/*.kdbx /media/hdd-data/alldata/Robert/Database/
    cp -vrpu ~/Database/*.kdbx /media/hdd-data/alldata/Robert/backup_dotelefonu/
    cp -vrpu ~/Database/*.txt /media/hdd-data/alldata/Robert/Database/
    cp -vrpu ~/Database/*.txt /media/hdd-data/alldata/Robert/backup_dotelefonu/
    # backup all dotfiles including hidden files
    # cp -vru ~/dotfiles-stow/ /media/hdd-data/alldata/Robert/Dotfiles/thisPC/
    # cp -vrpu ~/PycharmProjects/ /media/hdd-data/alldata/Robert/
    cp -vrpu ~/CppProjects/fraktale/src/*.cpp /media/hdd-data/alldata/Robert/CppProjects/fraktale/src
    cp -vrpu ~/CppProjects/fraktale/src/*.h /media/hdd-data/alldata/Robert/CppProjects/fraktale/src
    cp -vrpu ~/CppProjects/fraktale/doc/* /media/hdd-data/alldata/Robert/CppProjects/fraktale/doc
    cp -vrpu ~/CppProjects/multi/*.cpp /media/hdd-data/alldata/Robert/CppProjects/multi/
    #
    # GIT repo backup - bundle - if in given Git project
    if contains CppProjects $spwd
        echo "creating backup of GIT repo:"
        echo ""
        git bundle create $gitCppFile HEAD master
    end
    if contains latex $spwd
        echo "creating backup of latex GIT repo:"
        echo ""
        git bundle create $gitLatexFile HEAD master
    end
    if contains HTML $spwd
        echo "creating backup of HTML GIT repo:"
        echo ""
        git bundle create $gitHTMLFile HEAD master
    end
    if contains dotfiles-stow $spwd
        echo "creating backup of dotfiles-stow GIT repo:"
        echo ""
        git bundle create $gitStowFile HEAD master
    end
end
