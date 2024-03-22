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
    elif [ "$1" == "health" ]; then
        docker run --rm mumax3-custom-tool:latest /bin/bash -c "python3 /app/tools/gpu-health-check/main.py" 
    else
        echo "invalid command"
        showcommands
    fi
}

mx3tool "$1"
# 引数を増やしたい場合は以下のように変数を追加していく
# mx3tool "$1" "$2" "$3" ...
