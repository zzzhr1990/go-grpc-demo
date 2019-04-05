package main

import (
	"context"
	"log"

	ppl "github.com/zzzhr1990/common-grpc/go/services/util"
	"github.com/zzzhr1990/go-grpc-common/server"
	"google.golang.org/grpc"
)

// HelloServer is used to implement helloworld.GreeterServer.
type HelloServer struct{}

// Hello implements helloworld.GreeterServer
func (s *HelloServer) Hello(ctx context.Context, in *ppl.HelloRequest) (*ppl.HelloResponse, error) {
	log.Printf("Received: %v", in.Cid)
	return &ppl.HelloResponse{Sid: "Hello " + in.Cid}, nil
}

func main() {
	s := grpc.NewServer()
	ppl.RegisterHelloServiceServer(s, &HelloServer{})
	f := &ppl.HelloRequest{}
	f.Cid = "11"
	server.RunAndHold(s, 8964)
}
