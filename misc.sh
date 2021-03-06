bhclone () {
    name=$1
    shift
    git clone https://github.com/bryanhann/${name} ${*}
}


function wpy {
    echo $(python -c "import sys;print(sys.executable)");
}

function gpip    {
    __DOC__ 'gpip ->  force pip'
    PIP_REQUIRE_VIRTUALENV="" pip "$@";
}

function cfg     {
    __DOC__ 'cfg --> pushd to the bash conf'
    pushd ${BCH_SHELL_DIR};
}

function sg      {
    __DOC__ 'sg -- pipe set through a grep'
    set | grep $1 ;
}

function bhpip    {
    __DOC__ 'bhpip --> pip with cache'
    pip --cache-dir ${PIP_DOWNLOAD_CACHE} $* ; i
}

function clean {
    __DOC__ 'clean -- clean up current folder'
    rm -rf __pycache_ 2> /dev/null
    rm *.pyc         2> /dev/null
    rm .pytest_cache 2> /dev/null
}

downfind () {
    target=$1
    [ -z $2 ] && folder=$(grealpath ${PWD})
    [ ! -z $2 ] && folder=$(grealpath $2)

    while [ true ]; do
        [ -d ${folder}/${target} ] && {
            echo $(grealpath ${folder}/${target});
            return;
        }
        [ "${folder}" = "$(dirname $folder)" ] && break
        folder=$(dirname ${folder})
    done
}
