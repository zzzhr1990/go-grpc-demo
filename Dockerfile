FROM registry.cn-beijing.aliyuncs.com/qietv/alpine-cn:3.8

COPY bin/go-grpc-demo /go-grpc-demo
# COPY src/swagger-ui /swagger-ui

EXPOSE 1323

CMD ["/go-grpc-demo"]