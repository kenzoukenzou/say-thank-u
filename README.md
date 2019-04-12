# 1.アプリケーション概要
* 「感謝の気持ち」を書き込むSNSというテーマで作成したWebアプリ
* https://say-thank-u.herokuapp.com/login より 「test/test」 でログイン可能です
* （テストユーザーはユーザー編集、退会ができないようにしてあります）

# 2.機能一覧
* ログイン,ログアウト,新規登録機能
* ユーザー情報編集機能,ユーザー画像アップロード機能
* 新規投稿機能
* 投稿編集削除機能(投稿削除・投稿編集機能はAjaxで処理)
* バリデーションによる機能使用制限
* レスポンシブ対応済

# 3.使用技術
* インフラ：Herokuを使用
* 画像アップロード機能：Active Storageを使用
* 画像保存先：AWS S3を使用
* テンプレートエンジン：ERBを使用
* Ajax：rails-ujsを使用
* OGP設定：meta-tagsを使用

# 4.工夫点
* Ajaxの仕組みで画面遷移なく、投稿を編集・削除できるよう実装
* 新規投稿についてもTwitterのUIを真似て、モダールウィンドウから投稿できるよう実装
