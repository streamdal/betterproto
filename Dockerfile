FROM python:3.11

RUN apt-get update -y && apt-get install -y protobuf-compiler

RUN pip install "betterproto[compiler]"

RUN mkdir /defs

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

WORKDIR /defs

ENTRYPOINT ["/entrypoint.sh"]
