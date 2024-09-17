package main

import (
	"fmt"
	"log"
	"net/http"
)

func hello(w http.ResponseWriter, req *http.Request) {
	log.Println("Receiving hello request")
	fmt.Fprintf(w, "Hello from the server!\n")
	log.Println("Sending hello response.")
}

func main() {
	http.HandleFunc("/hello", hello)
	log.Println("Server is running")
	http.ListenAndServe(":8080", nil)
}
