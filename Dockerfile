FROM debian:sid

RUN apt-get update && apt-get install -y python3 python3-pip gcc python3-dev make cmake gnupg reprepro

WORKDIR /keys
ENV GNUPGHOME /keys
COPY key-creator .
RUN gpg --batch --generate-key key-creator

WORKDIR /build
COPY hello1 ./hello1
COPY hello2 ./hello2

RUN dpkg-deb --build hello1
RUN dpkg-deb --build hello2

COPY distributions /repos/apt/debian/conf/distributions
COPY reprepro-options /repos/apt/debian/conf/options
WORKDIR /repos/apt/debian/

RUN reprepro includedeb stretch /build/hello1.deb
RUN gpg --armor --output /repos/apt/debian/conf/test.gpg.key --export
EXPOSE 55555
ENTRYPOINT ["python3", "-m", "http.server", "55555"]
