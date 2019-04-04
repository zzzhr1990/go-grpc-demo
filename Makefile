GOOS=$(shell go env | grep GOOS | awk -F "=" '{print $$NF}' | awk -F "\"" '{print $$2}')
GOARCH=$(shell go env | grep GOARCH | awk -F "=" '{print $$NF}' | awk -F "\"" '{print $$2}')
NAME=$(shell pwd | awk -F "/" '{print $$NF}')
SERVICE=bin/$(NAME)
IMAGE=registry.cn-beijing.aliyuncs.com/qietv/$(NAME)
TAG?=latest
ENTRY=demo.go

default: build
build:
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(SERVICE) $(ENTRY)
linux:
	GOOS=linux GOARCH=amd64  go build -o $(SERVICE) $(ENTRY)
darwin:
	GOOS=darwin GOARCH=amd64  go build -o $(SERVICE) $(ENTRY)
windows:
	GOOS=windows GOARCH=amd64  go build -o $(SERVICE) $(ENTRY)
image: linux
	docker build --no-cache -t $(IMAGE):$(TAG) .
push: image
	docker push $(IMAGE):$(TAG)
clean:
	rm -rf $(SERVICE)
run: build
	MYSQL_CONNECTION="admin:admin@tcp(localhost:3306)/jsq-user?charset=utf8mb4&parseTime=True&loc=Local" \
	./$(SERVICE)