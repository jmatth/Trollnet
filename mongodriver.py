#!/usr/bin/python

import pymongo
import random
import commands
import sys
from pymongo import Connection

connection = Connection('10.42.0.1', 27017)

db = connection.trollfi

collect = db.users

stdin = sys.stdin.readline()

out = db.users.find({}, { "last": 1 });
for item in out:
	if item["last"] != "":
		print item["last"]
	else:
		commands.getoutput('/home/josh/HackNY2012/russ.pl')

db.users.remove({})

post = { "last" : stdin }
collect.insert(post)

#post = { "last" : "" }

#collect.insert(post)

#while True:	
#	stdin = sys.stdin.readline()
#	for line in stdin:
#		out = db.users.find({}, { "last": 1 });
#		for item in out:
#			if item["last"] != "":
#				print item["last"]
#			else:
#				commands.getoutput('/home/josh/HackNY2012/russ.pl')
#		#ran = random.randint(0, 10)
#		#if ran<=4:
#		#	stdin=""
#		db.users.remove({});
#		post = { "last" : stdin }
#		collect.insert(post)
