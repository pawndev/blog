---
title: "Go SSH Client Connection With SSH Certificates"
date: 2023-04-24T13:21:29+02:00
draft: false
lastmod: 2023-04-24
description: "Using SSH certificates to handle SSH/SFTP connection in Go"
summary: "Using SSH certificates to handle SSH/SFTP connection in Go"
tags: ['go', 'tips', 'TIL']
categories: ['go']
resources:
- name: featured-image
  src: images/ssh-go.png
---

At work, I was asked to refactor our SFTP authentication from a couple username/password to an SSH certificate authentication.
So, I'll post that snippet here, in case of someone need it someday, or just the future me for a future similar task.

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