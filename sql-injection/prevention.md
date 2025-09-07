# Prevention (SQL Injection)

## Python (psycopg2)
```python
cur.execute("SELECT * FROM users WHERE email=%s", (email,))
```

## Node.js (mysql2)
```js
const [rows] = await db.execute("SELECT * FROM users WHERE email=?", [email]);
```

## PHP (PDO)
```php
$stmt = $pdo->prepare("SELECT * FROM users WHERE email=?");
$stmt->execute([$email]);
```

## Java (JDBC)
```java
PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email=?");
ps.setString(1, email);
ResultSet rs = ps.executeQuery();
```
