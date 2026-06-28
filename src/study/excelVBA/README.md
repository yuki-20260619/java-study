# Excel VBA CSV集計ツール

## 概要
CSVファイルを読み込み、集計処理を行うExcel VBAツールです。

## 開発状況
開発中です。

## 構成
- 標準モジュール
    - ReadMain.bas
    - TotalMain.bas
    - Log.bas

- クラスモジュール
    - Setting.cls
    - Csv.cls
    - Fso.cls
    - Log.cls

## 設計方針
- 処理をモジュールごとに分割する
- 設定情報をクラスで管理する
- CSV読込処理を共通化する
- ログ出力によりエラー発生時の確認をしやすくする