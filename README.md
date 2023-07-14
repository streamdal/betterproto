# streamdal/betterproto docker image

This image is used to compile protocol buffers for python.
The standard `protoc --python_out` implementation produces ugly and un-importable code

### Building 

```bash
make docker/build
```

### Running
```bash
docker run streamdal/betterproto:latest --betterproto_out=... --more-protoc-args=...
```