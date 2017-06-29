FROM haskell:8
MAINTAINER Alex Brandt <alunduil@alunduil.com>

EXPOSE 80
WORKDIR /usr/local/src/dungeon.studio

RUN cabal update

COPY ./dungeon-studio.cabal /usr/local/src/dungeon.studio/dungeon-studio.cabal
RUN cabal install --only-dependencies

COPY . /usr/local/src/dungon.studio
RUN cabal install

ENTRYPOINT [ "dungeon-studio" ]
