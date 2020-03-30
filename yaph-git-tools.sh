# @see http://www.cyberciti.biz/tips/handling-filenames-with-spaces-in-bash.html
# source: https://github.com/yaph/git-tools

find_uncommitted () {
    local IFS=$(echo -en "\n\b")
    find . -type d -name '.git' | while read f
    do
        DIR=$(dirname "$f")
        pushd $DIR > /dev/null
        GDO=$(git diff --exit-code .)
        [ -n "$GDO" ] && echo $DIR
        popd > /dev/null
    done
}

find_gitgc () {
    CWD=`pwd`
    SAVEIFS=$IFS
    IFS=$(echo -en "\n\b")
    find . -type d -name '.git' | while read f
    do
        DIR=`dirname $f`
        cd $DIR
        GDO=`git gc`
        echo $DIR
        cd $CWD
    done
    IFS=$SAVEIFS
}
