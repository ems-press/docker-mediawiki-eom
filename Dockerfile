FROM mediawiki:1.34.1

RUN apt-get update && \
  apt-get install -y asymptote && \
  rm -rf /var/lib/apt/lists/*
