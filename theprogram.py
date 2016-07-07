#!/usr/bin/env python

import os
import sys

# Ensure that we look for any modules in our local lib dir.  This allows simple
# testing and development use.  It also does not break the case where the lib
# has been installed properly on the normal sys.path
sys.path.insert (0,
    os.path.join(os.path.dirname(os.path.abspath(__file__)),'lib')
)
# I would use site.addsitedir, but it does an append, not insert

import example

if __name__ == '__main__':
    print example.hellostr()
