# astro-psql
PostgreSQL with astronomy extensions

The following command will start a Postgres 14 deamon with the pg_sphere module installed:

docker run --rm --name pg-docker -e POSTGRES_PASSWORD=<pass> -d -p 5432:5432 -v <path to store data locally>:/var/lib/postgresql/data astrodata/astro-psql:14

The database can be accessed via:

docker exec -it pg-docker psql -U postgres -d postgres

Create the pg_sphere extension with:

docker exec -it pg-docker psql -c "CREATE EXTENSION pg_sphere;" postgres -U postgres
docker exec -it pg-docker psql -c "CREATE EXTENSION pg_healpix;" postgres -U postgres
