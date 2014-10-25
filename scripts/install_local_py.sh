#!/bin/bash

# Load the variables from the ENV
DB_USER=$USER
DB_PASS=$PASS
DB_NAME=$DB
LOCAL_PY_PATH=$FILE

cat > $LOCAL_PY_PATH << EOF
#! /usr/bin/env python2.7
from default import *

# local settings
DEBUG = True
TEMPLATE_DEBUG = DEBUG

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': '$DB_NAME',
        # The rest is not used with sqlite3:
        'USER': '$DB_USER',
        'PASSWORD': '$DB_PASS',
        'HOST': 'localhost',
        'PORT': '',
    }
}

if DEBUG:
    # set INTERNAL_IPS to entire local network
    from fnmatch import fnmatch

    class WildcardNetwork(list):
        def __contains__(self, key):
            for address in self:
                if fnmatch(key, address):
                    return True
            return False

    INTERNAL_IPS = WildcardNetwork(['127.0.0.1', '192.168.*.*'])

    # URL that handles the media, static, etc.
    STATIC_URL = '/static/'
    MEDIA_URL = STATIC_URL + 'media/'
    
EOF
