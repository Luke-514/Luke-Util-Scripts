# Luke-Util-Scripts
個人的に使いたくて作ったスクリプトの置場です  
適当に増えたりするかもしれません  

# ライセンスについて
Windows用のスクリプトは**MIT**  
Linux用のスクリプトは**GPL-3.0**です  

# ダウンロード
以下のボタンを押すと、一括ダウンロードが可能です  
  
<a href="https://github.com/Luke-514/Luke-Util-Scripts/archive/refs/heads/main.zip"><img src="https://github.com/user-attachments/assets/73eeb95a-bb46-4100-aa49-9407ff77272b" width="200" alt="ダウンロードはこちら！"></a>  

# 各スクリプトの説明
https://lukesplaygrounds.com/introduction-to-scripts-created-as-a-hobby/
## Windows
### App_List_Generator
Windowsにインストールされているアプリケーション一覧を取得します  
結果はバッチを実行したフォルダに**App_List.txt**の名前で出力されます  

### DxDiag_Generator
Windowsの環境などを確認できるDxDiagの結果を出力します  
結果はバッチを実行したフォルダに**dxdiag.txt**の名前で出力されます  
出力に時間がかかるため、黒い画面は自動で閉じるまで何もしないでください  

### HW_Info
簡単なハードウェア情報などを表示します  
実行権限が無く、はじかれる場合は**ps1_exe.bat**を使用するか、実行ポリシーを変更してください  
  
同じフォルダに**dxdiag.txt**があれば、VRAMの情報が正確に表示される可能性があります  
(dxdiag.txtが無くてもGPUの型番は表示可能です)  

### HW_Info_And_Dxdiag
**DxDiag_Generator.bat**の内容と、**HW_Info.ps1**を同時実行するバッチです  
同じフォルダに**HW_Info.ps1**が配置されている必要があります  

### Image_Resize
画像のサイズを変更します  
  
バッチファイルに画像をドラッグ&ドロップすると、ファイル名の最後に_resizeの付いた画像ファイルを出力します  
  
初回実行時に**ffmpeg**がPCに入っていなければ自動でインストールしますが、  
一旦バッチを終了しないと反映されないため、インストール完了後に再度画像をドラッグ&ドロップしてください  
  
画像の幅を調整したい場合は、バッチファイル内の**IMAGEWIDTH=1024**の数値部分を変更してください  
(変更する際は横幅を指定してください　縦幅は自動計算されます)  

### Open_Startup_Folder
スタートアップフォルダを開きます  
開いたフォルダにアプリケーションのショートカットを配置しておくと、Windowsの起動時に自動起動します  

### Restart_And_UEFI_Startup
Windowsを再起動してUEFIのセットアップ画面に移動します  
実行すると警告なしに再起動するので注意してください  

### Video_to_GIF
動画をGIFに変換します  
  
バッチファイルに動画をドラッグ&ドロップすると、gifファイルを出力します  
  
初回実行時に**ffmpeg**がPCに入っていなければ自動でインストールしますが、  
一旦バッチを終了しないと反映されないため、インストール完了後に再度動画をドラッグ&ドロップしてください  
  
動画の幅を調整したい場合は、バッチファイル内の**VIDEOWIDTH=640**の数値部分を変更してください  
(変更する際は横幅を指定してください　縦幅は自動計算されます)  

### Video_to_H264
動画をH.264(AVC)に変換します  
  
H.265(HEVC)のコーデックが無く、動画が再生できない時などにお使いください  
バッチファイルに動画をドラッグ&ドロップすると、ファイル名の最後に_convertの付いた動画ファイルを出力します  
  
初回実行時にffmpegがPCに入っていなければ自動でインストールしますが、  
一旦バッチを終了しないと反映されないため、インストール完了後に再度動画をドラッグ&ドロップしてください  
  
画質を調整したい場合は、バッチファイル内の**IMAGEQUALITY=23**の数値部分を変更してください  
(0から51の間で調整可能　数値が小さいほど高画質になります)  
  
エンコード速度と圧縮率のバランスを変更したい場合は、バッチファイル内の**PRESET=veryfast**の  
文字列部分を変更してください  
(ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslowが指定可能)  
(推奨はmediumかveryfastです)  

### Video_Resize
動画の容量を減らします  
  
バッチファイルに動画をドラッグ&ドロップすると、ファイル名の最後に_resizeの付いた動画ファイルを出力します  
  
初回実行時にffmpegがPCに入っていなければ自動でインストールしますが、  
一旦バッチを終了しないと反映されないため、インストール完了後に再度動画をドラッグ&ドロップしてください  
  
画質を調整したい場合は、バッチファイル内の**IMAGEQUALITY=23**の数値部分を変更してください  
(0から51の間で調整可能　数値が小さいほど高画質になります)  
  
エンコード速度と圧縮率のバランスを変更したい場合は、バッチファイル内のPRESET=veryfastの  
文字列部分を変更してください  
(ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslowが指定可能)  
(推奨はmediumかveryfastです)  

### Win10_Style_RightClickMenu
Windows11の右クリックメニューを従来版に戻します  
適用後は再起動が必要です  

### ps1_exe
ps1ファイル(PowerShellスクリプト)を**Bypass**で実行します  
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
X：@rx_luke  
  
[お問い合わせ](https://lukesplaygrounds.com/about/)

# 寄付
<a href="https://www.buymeacoffee.com/Luke514" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>
