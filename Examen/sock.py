#!/usr/bin/python

import socket, sys, time

ip = '127.0.0.1'
port = 39321

print("\x6a\x45\x53\x55\x53\x2d\x65\x4e\x52\x49\x51\x2d\x55\x45\x70\x41\x43\x2d\x48\x45\x43\x4f\x66\x52\x41\x4e\x43\x4f\x8a\x0a")

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
connect = s.connect((ip, port))

time.sleep(5)

#s.send("\x4a\x65\x73\x75\x73\x2d\x45\x6e\x72\x69\x71\x2d\x75\x65\x50\x61\x63\x2d\x68\x65\x63\x6f\x46\x72\x61\x6e\x63\x6f\x78\x0a")
s.send("\x6a\x45\x53\x55\x53\x2d\x65\x4e\x52\x49\x51\x2d\x55\x45\x70\x41\x43\x2d\x48\x45\x43\x4f\x66\x52\x41\x4e\x43\x4f\x8a\x0a")
#s.send("\x6a\x45\x53\x55\x53\x2d\x65\x4e\x52\x49\x51\x2d\x55\x45\x00\x00\x00\x2d\x70\x61\x63\x68\x65\x63\x6f\x66\x63\x6f\x6b\x0a")
