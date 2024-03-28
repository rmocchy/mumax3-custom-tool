# Mumax3 simulator custom tool
マイクロ磁気シミュレータmumax3( https://github.com/mumax/3 )を仮想環境上で動くようにした上でより便利に使うためのメソッドを追加しました．

mumax3のAPIについては以下の通りです
- 公式ドキュメント
https://mumax.github.io/api.html
- 補足資料
https://zenn.dev/mozuku55/articles/32761c23aa4acf


## 設計
本プログラムは仮想マシンDocker上で動作し，独自コマンド```mx3tool```をからシミュレーションを含む諸々の指定処理を行います．

よって利用にはGPU備え付けのPCを使う必要があり，またDockerとmakeコマンドのインストールが必要となります．
### ファイル構成
```
.
├── Dockerfile : 仮想環境設定ファイル
├── README.md  : 本ファイル(document)
├── init.sh    : 初期実行ファイル
├── router.sh  : コマンド定義ファイル
└── /src
        ├── /mumax3-executer  : mumax3処理の管理を行う
        |       └── main.py
        ├── /mumax3-test      : mumax3の動作確認用
        |       └── main.py
        └── /tools            : ツール定義用
                ├── genmx3.py : mx3ファイル生成
                └── gpu-health-check.py : gpuヘルスチェック
```


### 仮想マシン上のファイル構成
```
/app
 ├── /mumax3 : mumax公式のソース
 │
 ├── /mumax3-test : gpu不使用での動作テスト用ソース
 │      ├── mumax3-test.py
 │      └── mumax3-convert-test.py
 ├── /tools
 │      ├── gpu-health-check.py
 │      └── genmx3.py
 └── /mumax3-executer
        ├── mumax3-executer.py
        └── mumax3-executer-test.py

/vm-input : localのinputと同期
    ├── /sampleA(任意名)
    │       ├── xxx.mx3
    │       ├── yyy.mx3
    │
    ├── /sampleB(任意名)
    │       ├── yyy.mx3
    │
    ├── /sampleC(任意名)

/vm-output : localのoutputと同期
    ├── /sampleD(任意名)
    　       ├── /xxx.out
    　              ├── table.txt

```


## get started
### 1.必要ソフトのインストール
本ツールの使用は以下ソフトのインストールを前提としております
 - wsl
 - docker
### 2.初期構築
本ディレクトリまで移動し、以下コマンドを実行してください
ただしCUDAのバージョンが合致しない旨のエラーが出た場合にはDockerfileの修正をお願いします
#### シンボリックリンクの作成
```
sudo ln -s $(pwd)/router.sh /usr/local/bin/mx3tool
```
#### 実行権限の付与
```
sudo sudo chmod +x /usr/local/bin/mx3tool
```
#### 仮想環境buildの実行
```
bash init.sh
```
こちらのコマンドでは以下作業が実行されます
初期実行は1時間以上かかる可能性があります
- /usr/local/bin/mx3toolのシンボリックリンクの構築
- mx3toolコマンドへの実行権限付与
- mx3toolで利用する仮想環境の構築

## 使い方
### バージョン確認
```
mx3tool version
```

### GPUヘルスチェック(GPUが利用可能かどうかの確認)
```
mx3tool health
```

### mx3ファイル(シミュレーション用ファイル)の生成
```
mx3tool gen-mx3
```

### mx3シミュレーションの実行
```
mx3tool start
```