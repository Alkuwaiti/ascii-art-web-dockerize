package main

import (
	handler "ascii-art-web/handlers"
	"net/http"
)

func main() {
	http.HandleFunc("/", handler.GetHandler)
	http.HandleFunc("/ascii-art", handler.PostHandler)
	
	http.ListenAndServe(":8080", nil)
}