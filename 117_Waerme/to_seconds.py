#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

import sys

if __name__ == '__main__':
    with open(sys.argv[1]) as f:
        for line in f:
            words = line.split()
            time = words[0].split(':')
            seconds = int(time[0]) * 60 + int(time[1])

            print seconds, words[1]
