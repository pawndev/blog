---
title: "Go SSH Client: Connexion avec un certificat SSH"
date: 2023-04-24T13:21:29+02:00
draft: false
lastmod: 2023-04-24
description: "Utiliser un certificat SSH pour gérer une connexion SSH/SFTP en Go"
summary: "Utiliser un certificat SSH pour gérer une connexion SSH/SFTP en Go"
tags: ['go', 'tips', 'TIL']
categories: ['go']
resources:
- name: featured-image
  src: images/ssh-go.png
---

J'ai eu un ticket au travail me demandant de changer la méthode d'authentification à un SFTP, passant d'un couple
nom de compte / mot de passe, jusqu'à une connexion faite par un certificat SSH.
Je vais donc mettre ce bout de code, au cas où quelqu'un en aurait besoin un jour, ou juste moi à l'avenir.

```go
package main

import (
	_ "embed"
  "golang.org/x/crypto/ssh"
)

//go:embed resources/id_rsa
var privateKey []byte

var user = "boulou"

func main() {
  // here we create a signer base on the private key
  signer, err := ssh.ParsePrivateKey(privateKey)
  if err != nil {
    // TODO: handle error gracefully 
    panic(err)
  }

  sshClientConfig := &ssh.ClientConfig{
    User: user,
    Auth: []ssh.AuthMethod{
      ssh.PublicKeys(signer),
    },
    HostKeyCallback: ssh.InsecureIgnoreHostKey(),
  }
  
  // And we have our client config, you can use this to handle an `ssh.Dial` call :
  conn, err := ssh.Dial(
    "tcp",
    "boulou.example:22",
    sshClientConfig,
  )
  if err != nil {
    // TODO: handle error gracefully 
    panic(err)
  }

  defer func() {
	  // don't forget to close the connection
    if errC := conn.Close(); errC != nil {
		panic(errC)
    }
  }()
}
```