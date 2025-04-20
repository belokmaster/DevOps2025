package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

type User struct {
	ID    int
	Name  string
	Email string
}

var users = []User{
	{ID: 1, Name: "Alice", Email: "alice@gmail.com"},
	{ID: 2, Name: "Bob", Email: "bob@example.com"},
	{ID: 3, Name: "Charlie", Email: "charlie@mail.ru"},
	{ID: 4, Name: "VENIK", Email: "doter228@yandex.ru"},
	{ID: 5, Name: "Gay", Email: "gay@example.com"},
}

func main() {
	http.HandleFunc("/", handler)

	port := os.Getenv("APP_PORT")
	if port == "" {
		port = "8080"
	}

	log.Printf("Server starting on port %s", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Users:\n")
	for _, user := range users {
		fmt.Fprintf(w, "ID: %d, Name: %s, Email: %s\n", user.ID, user.Name, user.Email)
	}
}
