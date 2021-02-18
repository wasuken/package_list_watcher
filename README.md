# README

## テーブル定義

### servers

パッケージ取得先のサーバ情報テーブル

* name

* pac_type

* arch

### packages

取得したパッケージ情報

* name

* version

### server_packages

servers -* packages

* server_id

* package_id

### latest_packacges

* package_id
