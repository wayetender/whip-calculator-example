FROM wayetender/whip:v0.1.0
WORKDIR /example
COPY . .
RUN mkdir -p gen-py && thrift --gen py -out src src/calc.thrift
