# README

## テーブル定義

### servers

サーバ情報

* name

* pac_type

	本当はpackageか、captureごとに依存するんだろうけど、サーバに依存させることで、
	無駄な更新を減らす。というわけでサーバは名前ごとではなく、サーバとパッケージ管理システムで一意とする。

* other_info

  なんかつめこみたいときにいれるやつ。正直いらんかも。

### packages

パッケージ情報

* name

* description

### package_versions

パッケージのバージョン情報

* package_id

* version

### captures

エージェントから情報を取得した際の情報

* server_id

* package\_versions_id

	長いので省略！
