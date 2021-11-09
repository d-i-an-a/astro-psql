FROM postgres:14

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
&& make install \
&& rm -rf /root/pgsphere /root/pg_healpix \
&& apt remove -y \
	make \
	git \
	gcc \
	postgresql-server-dev-14 \
	flex \
	bison \
&& rm -rf /var/lib/apt/lists/*
