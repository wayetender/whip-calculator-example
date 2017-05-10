FROM wayetender/whip
WORKDIR /example
COPY . .
RUN mkdir -p gen-py && thrift --gen py -out src src/calc.thrift
