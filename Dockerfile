FROM postgres:14 as build

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
		make \
		git \
		gcc \
		postgresql-server-dev-14 \
		flex \
		bison \
    --reinstall ca-certificates \    
	&& USE_PGXS=1 \
	&& PG_CONFIG=/usr/bin/pg_config \
	&& cd /root \
	&& git clone --depth 1 https://github.com/d-i-an-a/pgsphere.git \
	&& cd pgsphere \
	&& make USE_PGXS=1 PG_CONFIG=/usr/bin/pg_config \
	&& make USE_PGXS=1 PG_CONFIG=/usr/bin/pg_config install \
	&& cd /root \
	&& git clone --depth 1 https://github.com/d-i-an-a/pg_healpix.git \
	&& cd pg_healpix \
	&& make \
	&& make install

FROM postgres:14

COPY --from=build /usr/share/postgresql/14/ /usr/share/postgresql/14/
COPY --from=build /usr/lib/postgresql/14/ /usr/lib/postgresql/14

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]

