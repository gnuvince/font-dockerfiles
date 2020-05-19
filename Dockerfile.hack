FROM debian:10

RUN apt-get update                                                     \
 && apt-get -y install python3-pip build-essential git curl zlib1g-dev \
 && pip3 install pipenv fs                                             \
 && TMPDIR=$(mktemp -d)                                                \
 && git clone https://github.com/source-foundry/Hack.git $TMPDIR       \
 && git -C $TMPDIR checkout dev                                        \
 && make -C $TMPDIR compile-local-dep                                  \
 && rm -rf $TMPDIR
