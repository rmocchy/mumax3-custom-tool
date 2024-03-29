#! /bin/bash

current_version=1.0

here_path=$(dirname "$0")


function showcommands {
    echo "
    <commands>
        mx3tool version : 現在のバージョンを表示
    "
}

function mx3tool {
    if [ "$1" == "version" ]; then
        echo "current version : $current_version"
    elif [ "$1" == "genmx3" ]; then
        echo "gen start"
        docker run -it --gpus all  --rm -v $PWD:/gen-async mumax3-custom-tool:latest /bin/bash -c "python3 /app/tools/gen-mx3.py && chmod 777 -R /gen-async"
    elif [ "$1" == "simexec" ]; then
        echo "sim exec start"
        docker run -it --gpus all  --rm -v $PWD:/exec-async mumax3-custom-tool:latest /bin/bash -c "python3 /app/mumax3-executer/main.py exec /exec-async"
    else
        echo "invalid command"
        showcommands
    fi
}

mx3tool "$1"
# 引数を増やしたい場合は以下のように変数を追加していく
# mx3tool "$1" "$2" "$3" ...
