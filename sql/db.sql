
DROP DATABASE IF EXISTS db;
CREATE DATABASE db;

DROP TABLE IF EXISTS db.user;
CREATE TABLE db.user (
  id    INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id PK',
  username    VARCHAR(255) NOT NULL
  COMMENT 'username',
  password    VARCHAR(255) NOT NULL
  COMMENT 'password' ,
  email    VARCHAR(255) NOT NULL UNIQUE
  COMMENT 'email'
)
  COMMENT 'user table';

SELECT count(*) FROM db.user;-- 数据的总条数642 8632

SELECT * FROM db.user;