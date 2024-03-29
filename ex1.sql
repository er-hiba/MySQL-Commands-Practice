mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test2              |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql> create database bdtest;
Query OK, 1 row affected (0.01 sec)

mysql> show create database bdtest;
+----------+----------------------------------------------------------------------------------------------------------------------------------+
| Database | Create Database                                                                                                                  |
+----------+----------------------------------------------------------------------------------------------------------------------------------+
| bdtest   | CREATE DATABASE `bdtest` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */ |
+----------+----------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> use bdtest;
Database changed
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bdtest             |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test2              |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> drop database bdtest;
Query OK, 0 rows affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test2              |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql> exit;
