# Luke-Util-Scripts
個人的に使いたくて作ったスクリプトの置場です  
適当に増えたりするかもしれません  

# ライセンスについて
Windows用のスクリプトはMIT  
Linux用のスクリプトはGPL-3.0です

# 各スクリプトの説明
## Windows
### App_List_Generator
Windowsにインストールされているアプリケーション一覧を取得するバッチファイル  
結果はバッチを実行したフォルダにApp_List.txtの名前で出力されます

### DxDiag_Generator
Windowsの環境などを確認できるDxDiagの結果を出力するバッチファイル  
結果はバッチを実行したフォルダにdxdiag.txtの名前で出力されます  
出力に時間がかかるため、黒い画面は自動で閉じるまで何もしないでください

### Open_Startup_Folder
スタートアップフォルダを開くバッチファイル  
開いたフォルダにアプリケーションのショートカットを配置しておくと、Windowsの起動時に自動起動してくれます

### Restart_And_UEFI_Startup
Windowsを再起動してUEFIのセットアップ画面に移動するバッチファイル  
実行すると警告なしに再起動するので注意  

### SCKill
Star Citizenがハングした等で何もできなくなった際に強制終了させるバッチファイル  

### Win10_Style_RightClickMenu
Windows11の右クリックメニューを従来版に戻すレジストリファイル  
適用後は再起動が必要です  

## Linux
### Switch_Root
実行すると実行中のユーザーパスワードでRootユーザーになることができます

### Check_Over_Size_FS
引数に指定した使用率より大きいファイルシステムを出力します  
ex) ./Check_Over_Size_FS.sh 80

# 免責事項
スクリプトなどの使用によって発生した、いかなる損害に対しても作者は一切の責任を負いません。  
