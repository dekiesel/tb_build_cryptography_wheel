FROM python:3.9-slim-bullseye
RUN mkdir /output
WORKDIR /workdir
RUN  apt-get update 
RUN apt-get install -y --no-install-recommends python3-wheel gcc musl-dev python3-dev libffi-dev libssl-dev cargo pkg-config wget python3-virtualenv curl build-essential\
		 && rm -rf /var/lib/apt/lists/*
RUN wget http://ftp.dk.debian.org/debian/pool/main/libf/libffi/libffi6_3.2.1-9_armhf.deb -O libffi6.deb
RUN apt-get install ./libffi6.deb
COPY tb_cryptography.sh /workdir
ENTRYPOINT ["bash", "/workdir/tb_cryptography.sh"]

