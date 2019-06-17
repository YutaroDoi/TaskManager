# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* 

### Tasksテーブルスキーマ

| カラム名 | 型 | 説明 |
|:--|:--|:--|
| id | BIGINT | タスクに対して一意の識別番号。データベースの自動採番(AUTO INCREMENT)を使用。UNSIGNED 。|
| name | VARCHAR(255) | タスク名 |
| task_description | TEXT | タスク説明 |
| expire | DATETIME | タスクの終了期限 |
| status | VARCHAR(16) | タスクの実施状況 |
| label | VARCHAR(32) | タスクの種類を表すラベル |
| user_id | BIGINT | タスク作成者のユーザID |
| priority | TINYINT | タスクの優先順位。数字が小さいほど優先順位が高い。UNSIGNED |
| created_at | DATETIME | 作成日時 |
| modified_at | DATETIME | 修正日時 |

```sql
# users.sql
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` BIGINT NOT NULL AUTO_INCREMENT UNSIGNED,
  `name` VARCHAR(255) NOT NULL,
  `task_description` TEXT,
  `expire` DATETIME,
  `status` VARCHAR(16) NOT NULL,
  `label` VARCHAR(32),
  `user_id` BIGINT NOT NULL,
  `priority` TINYINT UNSIGNED,
  `created_at` DATETIME NOT NULL,
  `modified_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

### Usersテーブルスキーマ

| カラム名 | 型 | 説明 |
|:--|:--|:--|
| id | BIGINT | ユーザに対して一意の識別番号。データベースの自動採番(AUTO INCREMENT)を使用。UNSIGNED |
| name | VARCHAR(64) | ユーザーID |
| password | VARCHAR(64) | パスワード |
| admin | TINYINT | ユーザー権限。trueが管理者、falseが一般。 |

```sql
# users.sql
CREATE TABLE IF NOT EXISTS `users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT UNSIGEND,
  `name` VARCHAR(64) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  `admin` TINYINT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `modified_at` DATETIME NOT NULL,
  `created_at` DATETIME NOT NULL,
  `modified_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```