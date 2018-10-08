FROM wayetender/whip:v0.1.0
WORKDIR /example
COPY . .
RUN mkdir -p gen-py && LD_LIBRARY_PATH=/usr/local/lib thrift --gen py -out src src/calc.thrift
