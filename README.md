# Luke-Util-Scripts
個人的に使いたくて作ったスクリプトの置場です  
適当に増えたりするかもしれません  

# ライセンスについて
Windows用のスクリプトはMIT  
Linux用のスクリプトはGPL-3.0です  

# 各スクリプトの説明
## Windows
### App_List_Generator
Windowsにインストールされているアプリケーション一覧を取得します  
結果はバッチを実行したフォルダにApp_List.txtの名前で出力されます  

### DxDiag_Generator
Windowsの環境などを確認できるDxDiagの結果を出力します  
結果はバッチを実行したフォルダにdxdiag.txtの名前で出力されます  
出力に時間がかかるため、黒い画面は自動で閉じるまで何もしないでください  

### HW_Info
簡単なハードウェア情報などを表示します  
実行権限が無く、はじかれる場合はps1_exe.batを使用するか、実行ポリシーを変更してください  
  
同じフォルダにdxdiag.txtがあれば、VRAMの情報が正確に表示される可能性があります  
(dxdiag.txtが無くてもGPUの型番は表示可能です)  

### HW_Info_And_Dxdiag
DxDiag_Generator.batの内容と、HW_Info.ps1を同時実行するバッチです  
同じフォルダにHW_Info.ps1が配置されている必要があります  

### Open_Startup_Folder
スタートアップフォルダを開きます  
開いたフォルダにアプリケーションのショートカットを配置しておくと、Windowsの起動時に自動起動します  

### Restart_And_UEFI_Startup
Windowsを再起動してUEFIのセットアップ画面に移動します  
実行すると警告なしに再起動するので注意  

### Video_to_GIF
動画をGIFに変換します  
  
バッチファイルに動画をドラッグ&ドロップすると、gifファイルを出力します  
(初回実行時にffmpegがPCに入っていなければ自動でインストールします)  
  
動画の幅を調整したい場合は、バッチファイル内のVIDEOWIDTH=640の数値部分を変更してください  
(変更する際は横幅を指定してください　縦幅は自動計算されます)  

### Video_to_H264
動画をH.264(AVC)に変換します  
  
H.265(HEVC)のコーデックが無く、動画が再生できない時などにお使いください  
バッチファイルに動画をドラッグ&ドロップすると、ファイル名の最後に_convertの付いた動画ファイルを出力します  
(初回実行時にffmpegがPCに入っていなければ自動でインストールします)  
  
画質を調整したい場合は、バッチファイル内のIMAGEQUALITY=23の数値部分を変更してください  
(0から51の間で調整可能　数値が小さいほど高画質になります)  
  
エンコード速度と圧縮率のバランスを変更したい場合は、バッチファイル内のPRESET=veryfastの  
文字列部分を変更してください  
(ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslowが指定可能)  
(推奨はmediumかveryfastです)  

### Video_Resize
動画の容量を減らします  
  
バッチファイルに動画をドラッグ&ドロップすると、ファイル名の最後に_resizeの付いた動画ファイルを出力します  
(初回実行時にffmpegがPCに入っていなければ自動でインストールします)  
  
画質を調整したい場合は、バッチファイル内のIMAGEQUALITY=23の数値部分を変更してください  
(0から51の間で調整可能　数値が小さいほど高画質になります)  
  
エンコード速度と圧縮率のバランスを変更したい場合は、バッチファイル内のPRESET=veryfastの  
文字列部分を変更してください  
(ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslowが指定可能)  
(推奨はmediumかveryfastです)  

### Win10_Style_RightClickMenu
Windows11の右クリックメニューを従来版に戻します  
適用後は再起動が必要です  

### ps1_exe
ps1ファイル(PowerShellスクリプト)をBypassで実行します  
バッチファイルにps1ファイルをドラッグ&ドロップすると、スクリプトを実行します  

## Linux
### Check_CPU_and_MEM_Available
CPUのアイドルとメモリ、スワップの空きを表示します  
メモリはfreeコマンドのAvailableを参照しています  
引数にfreeコマンドの引数を指定できます  
ex) ./Check_CPU_and_MEM_Available.sh -m  

### Check_Over_Size_FS
引数に指定した値より使用率の大きいファイルシステムを出力します  
ex) ./Check_Over_Size_FS.sh 80  

# 参考
@yusuga (Yu Sugawara)  
[ffmpegでとにかく綺麗なGIFを作りたい](https://qiita.com/yusuga/items/ba7b5c2cac3f2928f040)

# 免責事項
スクリプトなどの使用によって発生した、いかなる損害に対しても作者は一切の責任を負いません。  

# 作者
Luke514  
Twitter:@rx_luke

# 寄付
<a href="https://www.buymeacoffee.com/Luke514" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>
