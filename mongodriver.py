#!/usr/bin/python

import pymongo
import random
import subprocess
from pymongo import Connection

connection = Connection()

db = connection.trollfi

collect = db.users

post = { "last" = "" }

collect.inset(post)

while True:	
	stdin = sys.stdin.readline()
	for line in stdin:
		out = db.users.find({}), { "last", 1 }
		if out != "":
			print out
		else:
			call(./cats.pl)
		ran = random.randint(0, 10)
		if ran<=4:
			stdin=""
		post = { "last" = stdin }
		collect.insert(post)
