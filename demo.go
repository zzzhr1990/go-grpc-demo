package main

import (
	"github.com/zzzhr1990/go-grpc-common/server"
	"google.golang.org/grpc"
)

func main() {
	s := grpc.NewServer()
	server.RunAndHold(s, 8964)
}
