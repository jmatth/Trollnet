#!/usr/bin/python

import pymongo
import random
import commands
import sys
from pymongo import Connection

connection = Connection('10.42.0.1', 27017)

db = connection.trollfi


