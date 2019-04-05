FROM golang


COPY bin/go-grpc-demo /go-grpc-demo
# COPY src/swagger-ui /swagger-ui

EXPOSE 8964

CMD ["/go-grpc-demo"]