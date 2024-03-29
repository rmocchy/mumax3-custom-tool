#! /bin/bash

current_version=1.0

here_path=$(dirname "$0")


function showcommands {
    echo "
    <commands>
        mx3tool version   : 現在のバージョンを表示
        mx3tool genmx3    : template.mx0とparams.jsonからmx3ファイルを生成
        mx3tool simexec   : コマンド操作時のディレクトリよりも深いディレクトリ内のmx3ファイルに対してシミュレーションを行う
        mx3tool simdryrun : 上記シミュレーションの対象となるmx3ファイルを表示する
    "
}

function mx3tool {
    if [ "$1" == "version" ]; then
        echo "current version : $current_version"
    elif [ "$1" == "genmx3" ]; then
        echo "gen start"
        docker run -it --gpus all  --rm -v $PWD:/gen-async mumax3-custom-tool:latest /bin/bash -c "python3 /app/tools/gen-mx3.py"
    elif [ "$1" == "simdryrun" ];then
        echo "sim dryrun start"
        docker run -it --gpus all  --rm -v $PWD:/exec-async mumax3-custom-tool:latest /bin/bash -c "python3 /app/mumax3-executer/main.py dryrun /exec-async"
    elif [ "$1" == "simexec" ]; then
        echo "sim exec start"
        docker run -it --gpus all  --rm -v $PWD:/exec-async mumax3-custom-tool:latest /bin/bash -c "python3 /app/mumax3-executer/main.py exec /exec-async"
        # ファイルを編集したりするための処理です必要ならコメントを消して使ってください
        # sudo chmod 777 -R $(pwd)
    else
        echo "invalid command"
        showcommands
    fi
}

mx3tool "$1"
# 引数を増やしたい場合は以下のように変数を追加していく
# mx3tool "$1" "$2" "$3" ...
