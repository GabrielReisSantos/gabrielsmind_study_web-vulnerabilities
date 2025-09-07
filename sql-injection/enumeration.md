# Manual Enumeration

## MySQL
```sql
SELECT @@version;
SELECT schema_name FROM information_schema.schemata;
SELECT table_name FROM information_schema.tables WHERE table_schema='acme';
SELECT column_name FROM information_schema.columns WHERE table_schema='acme' AND table_name='users';
```

## MSSQL
```sql
SELECT @@version;
SELECT name FROM master..sysdatabases;
SELECT name FROM sys.tables;
SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('users');
```

## PostgreSQL
```sql
SELECT version();
SELECT datname FROM pg_database;
SELECT table_name FROM information_schema.tables WHERE table_schema='public';
SELECT column_name FROM information_schema.columns WHERE table_name='users';
```
