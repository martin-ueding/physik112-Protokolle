#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

import datetime
import time

start = datetime.datetime.now()

while True:
    time.sleep(0.5)
    diff = datetime.datetime.now() - start
    print diff.seconds
