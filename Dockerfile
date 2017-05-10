FROM wayetender/whip

WORKDIR /example
COPY . .

RUN mkdir -p gen-py && thrift --gen py -out gen-py idl/calc.thrift \
	&& cp idl/calc.thrift gen-py \
	&& cp network.py gen-py \
	&& cp calculator.whip gen-py \
	&& cp -r gen-py/* adder \
	&& cp -r gen-py/* client \
	&& cp -r gen-py/* discovery
