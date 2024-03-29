mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| centre_formation   |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test2              |
| world              |
+--------------------+
8 rows in set (0.03 sec)

mysql> use test2;
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> create table Fruits(
    -> FruitID int,
    -> FruitName varchar(10)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> show tables;
+-----------------+
| Tables_in_test2 |
+-----------------+
| fruits          |
+-----------------+
1 row in set (0.00 sec)

mysql> desc fruits;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| FruitID   | int         | YES  |     | NULL    |       |
| FruitName | varchar(10) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> insert into fruits
    -> values
    -> (1, 'strawberry'),
    -> (2, 'banana'),
    -> (3, 'cherry');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from fruits;
+---------+------------+
| FruitID | FruitName  |
+---------+------------+
|       1 | strawberry |
|       2 | banana     |
|       3 | cherry     |
+---------+------------+
3 rows in set (0.00 sec)

mysql> alter table fruits
    -> add column FruitColor varchar(10)
    -> after FruitID;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc fruits;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| FruitID    | int         | YES  |     | NULL    |       |
| FruitColor | varchar(10) | YES  |     | NULL    |       |
| FruitName  | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> alter fruits
    -> add column quantity int;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'fruits
add column quantity int' at line 1
mysql> alter table fruits
    -> add column quantity int;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc fruits;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| FruitID    | int         | YES  |     | NULL    |       |
| FruitColor | varchar(10) | YES  |     | NULL    |       |
| FruitName  | varchar(10) | YES  |     | NULL    |       |
| quantity   | int         | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table fruits
    -> modify column quantity int non null;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'non null' at line 2
mysql> alter table fruits
    -> modify column quantity int not null;
ERROR 1138 (22004): Invalid use of NULL value
mysql> update fruits
    -> set quantity = 20;
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from fruits;
+---------+------------+------------+----------+
| FruitID | FruitColor | FruitName  | quantity |
+---------+------------+------------+----------+
|       1 | NULL       | strawberry |       20 |
|       2 | NULL       | banana     |       20 |
|       3 | NULL       | cherry     |       20 |
+---------+------------+------------+----------+
3 rows in set (0.00 sec)

mysql> desc Fruits;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| FruitID    | int         | YES  |     | NULL    |       |
| FruitColor | varchar(10) | YES  |     | NULL    |       |
| FruitName  | varchar(10) | YES  |     | NULL    |       |
| quantity   | int         | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table fruits
    -> modify column quantity int not null;
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc fruits;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| FruitID    | int         | YES  |     | NULL    |       |
| FruitColor | varchar(10) | YES  |     | NULL    |       |
| FruitName  | varchar(10) | YES  |     | NULL    |       |
| quantity   | int         | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table fruits
    -> drop FruitColor;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc fruits;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| FruitID   | int         | YES  |     | NULL    |       |
| FruitName | varchar(10) | YES  |     | NULL    |       |
| quantity  | int         | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * from fruits;
+---------+------------+----------+
| FruitID | FruitName  | quantity |
+---------+------------+----------+
|       1 | strawberry |       20 |
|       2 | banana     |       20 |
|       3 | cherry     |       20 |
+---------+------------+----------+
3 rows in set (0.00 sec)

mysql> update fruits
    -> set quantity = 10
    -> where FruitID = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from fruits;
+---------+------------+----------+
| FruitID | FruitName  | quantity |
+---------+------------+----------+
|       1 | strawberry |       20 |
|       2 | banana     |       10 |
|       3 | cherry     |       20 |
+---------+------------+----------+
3 rows in set (0.00 sec)

mysql> alter table fruits;
Query OK, 0 rows affected (0.01 sec)

mysql> alter table fruits
    -> modify column FruitName varchar(13) unique;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc fruits;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| FruitID   | int         | YES  |     | NULL    |       |
| FruitName | varchar(13) | YES  | UNI | NULL    |       |
| quantity  | int         | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> create table Desks;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table desks(
    -> idtable int);
Query OK, 0 rows affected (0.05 sec)

mysql> show tables;
+-----------------+
| Tables_in_test2 |
+-----------------+
| desks           |
| fruits          |
+-----------------+
2 rows in set (0.00 sec)

mysql> drop desks;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desks' at line 1
mysql> drop table desks;
Query OK, 0 rows affected (0.05 sec)

mysql> show tables;
+-----------------+
| Tables_in_test2 |
+-----------------+
| fruits          |
+-----------------+
1 row in set (0.00 sec)

mysql> desc fruits;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| FruitID   | int         | YES  |     | NULL    |       |
| FruitName | varchar(13) | YES  | UNI | NULL    |       |
| quantity  | int         | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> alter table fruits;
Query OK, 0 rows affected (0.01 sec)

mysql> alter table fruits
    -> rename quantity to Qt;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'to Qt' at line 2
mysql> alter table fruits
    -> rename column quantity to Qt;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc fruits;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| FruitID   | int         | YES  |     | NULL    |       |
| FruitName | varchar(13) | YES  | UNI | NULL    |       |
| Qt        | int         | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into fruits
    -> values
    -> (null, null, null);
ERROR 1048 (23000): Column 'Qt' cannot be null
mysql> insert into fruits
    -> values
    -> (null, null, 2);
Query OK, 1 row affected (0.01 sec)

mysql> select * from fruits;
+---------+------------+----+
| FruitID | FruitName  | Qt |
+---------+------------+----+
|       1 | strawberry | 20 |
|       2 | banana     | 10 |
|       3 | cherry     | 20 |
|    NULL | NULL       |  2 |
+---------+------------+----+
4 rows in set (0.00 sec)

mysql> alter table fruits
    -> modify column FruitID tinyint unique;
Query OK, 4 rows affected (0.13 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> desc fruits;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| FruitID   | tinyint     | YES  | UNI | NULL    |       |
| FruitName | varchar(13) | YES  | UNI | NULL    |       |
| Qt        | int         | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> alter table fruits
    -> modify column FruitID tinyint primary key;
ERROR 1138 (22004): Invalid use of NULL value
mysql> update fruits
    -> set FruitID = 4
    -> where Qt = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from fruits;
+---------+------------+----+
| FruitID | FruitName  | Qt |
+---------+------------+----+
|       1 | strawberry | 20 |
|       2 | banana     | 10 |
|       3 | cherry     | 20 |
|       4 | NULL       |  2 |
+---------+------------+----+
4 rows in set (0.00 sec)

mysql> desc fruits;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| FruitID   | tinyint     | YES  | UNI | NULL    |       |
| FruitName | varchar(13) | YES  | UNI | NULL    |       |
| Qt        | int         | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> alter table fruits
    -> modify column FruitID tinyint primary key;
Query OK, 0 rows affected (0.18 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc fruits;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| FruitID   | tinyint     | NO   | PRI | NULL    |       |
| FruitName | varchar(13) | YES  | UNI | NULL    |       |
| Qt        | int         | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> alter table fruits
    -> add check (qt > 1);
Query OK, 4 rows affected (0.15 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> update fruits
    -> set qt = 1
    -> where FruitID = 2;
ERROR 3819 (HY000): Check constraint 'fruits_chk_1' is violated.
mysql> update fruits
    -> set qt = 2
    -> where FruitID = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from fruits;
+---------+------------+----+
| FruitID | FruitName  | Qt |
+---------+------------+----+
|       1 | strawberry | 20 |
|       2 | banana     |  2 |
|       3 | cherry     | 20 |
|       4 | NULL       |  2 |
+---------+------------+----+
4 rows in set (0.00 sec)

mysql> create database testing;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| centre_formation   |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test2              |
| testing            |
| world              |
+--------------------+
9 rows in set (0.00 sec)

mysql> use world;
Database changed
mysql> show tables;
+-----------------+
| Tables_in_world |
+-----------------+
| city            |
| country         |
| countrylanguage |
+-----------------+
3 rows in set (0.00 sec)

mysql> drop testing;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'testing' at line 1
mysql> drop database testing;
Query OK, 0 rows affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| centre_formation   |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test2              |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> exit;
