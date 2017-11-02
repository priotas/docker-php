FROM priotas/docker-php 

RUN requirements="default-jre" \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && apt-get purge --auto-remove -y

RUN yarn global add selenium-standalone@5
RUN yarn global add forever
RUN selenium-standalone install
   