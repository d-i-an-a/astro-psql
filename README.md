# astro-psql
PostgreSQL with astronomy extensions `pg_sphere` and `pg_healpix`.

# Setup
The following command will start a Postgres 14 deamon with the pg_sphere module installed:

```
docker run --rm --name pg-docker -e POSTGRES_PASSWORD=<pass> -d -p 5432:5432 -v <path to store data locally>:/var/lib/postgresql/data astrodata/astro-psql:14
```

The database can be accessed via:

```
docker exec -it pg-docker psql -U postgres -d postgres
```

Create the pg_sphere extension with:

```
docker exec -it pg-docker psql -c "CREATE EXTENSION pg_sphere;" postgres -U postgres
docker exec -it pg-docker psql -c "CREATE EXTENSION pg_healpix;" postgres -U postgres
```

# Pg_sphere
This fork uses the fix for PostgreSQL 12 by [mdgomes](https://github.com/mdgomes/pgsphere).

For more information, have a look at [https://pgsphere.github.io/](https://pgsphere.github.io/) and [https://github.com/akorotkov/pgsphere](https://github.com/akorotkov/pgsphere)

# Pg_healpix

The pg_healpix extension can be found here:
[https://github.com/d-i-an-a/pg_healpix](https://github.com/d-i-an-a/pg_healpix)

# Upgrade

When upgrading from a previous version, it is very likely that the volume where the data are stored will be incompatible. You will have to dump and restore the database.

*As always, make sure you have proper back-ups.*
