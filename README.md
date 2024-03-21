# Mumax3 simulator custom tool
マイクロ磁気シミュレータmumax3( https://github.com/mumax/3 )を仮想環境上で動くようにした上でより便利に使うためのメソッドを追加しました．

mumax3のAPIについては以下の通りです
- 公式ドキュメント
https://mumax.github.io/api.html
- 補足資料
https://zenn.dev/mozuku55/articles/32761c23aa4acf


## 設計
本プログラムは仮想マシンDocker上で動作し，./makefileに記載されたコマンドをからシミュレーションを含む諸々の指定処理を行います．

よって利用にはGPU備え付けのPCを使う必要があり，またDockerとmakeコマンドのインストールが必要となります．

## get started

## 
