# ece356-a3

1. Isolation Method  
Let instance 1 represent the mysql instance performing the transaction, and instance 2 represent the instance that will be performing the queries. Below is the original state of the database.
```
mysql> select Enrollment from Offering where courseID='ECE356';
+------------+
| Enrollment |
+------------+
|         64 |
|        123 |
+------------+
2 rows in set (0.00 sec)

```
All the following results will be obtained the same way. Instance 1 will perform a begin and update, then instance 2 will query enrollment, then instance 1 will update and commit.
   1. REPEATABLE-READ  
   ```
   mysql> select Enrollment from Offering where courseID='ECE356';
    +------------+
    | Enrollment |
    +------------+
    |         64 |
    |        123 |
    +------------+
    2 rows in set (0.00 sec)
    ```
    Therefore, to instance 2 it is as if the enrollment has not yet chagned.
   1. READ-UNCOMMITTED
   ```
   mysql> select Enrollment from Offering where courseID='ECE356';
    +------------+
    | Enrollment |
    +------------+
    |         64 |
    |        123 |
    +------------+
    2 rows in set (0.00 sec)
    ```
   
   2. READ-COMMITTED
    ```
    mysql> select Enrollment from Offering where courseID='ECE356';
    +------------+
    | Enrollment |
    +------------+
    |         64 |
    |        123 |
    +------------+
    2 rows in set (0.00 sec)

    ```
   3. SERIALIZABLE
    ```
    +------------+
    | Enrollment |
    +------------+
    |         64 |
    |        123 |
    +------------+
    2 rows in set (0.00 sec)
    ```