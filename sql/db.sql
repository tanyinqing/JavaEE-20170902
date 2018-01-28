
DROP DATABASE IF EXISTS db;
CREATE DATABASE db;

DROP TABLE IF EXISTS db.tan;
CREATE TABLE db.tan (
  id    INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id PK',
  username    VARCHAR(255) NOT NULL
  COMMENT 'username',
  password    VARCHAR(255) NOT NULL
  COMMENT 'password' ,
  email    VARCHAR(255) NOT NULL
  COMMENT 'email'
)
  COMMENT 'ip表';

SELECT count(*) FROM db.csdn;-- 数据的总条数642 8632