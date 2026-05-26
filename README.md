# Sparta SQL Practice

This repository contains my SQL practice work using the Northwind database.  
It includes queries written in PostgreSQL using `psql` and focuses on building confidence with core SQL concepts.

---

## Database Used

- Northwind sample database
- PostgreSQL

---

## How to Run

Make sure PostgreSQL is running and the Northwind database is created.

Run SQL files using:

```bash
cd src
psql -f file.sql
```

## Example Query
```
SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date > '1960-01-01';
```