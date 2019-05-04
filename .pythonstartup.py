import random
import logging
import os
import sys
import json
import datetime
import pickle
import glob
import re
import base64
import subprocess
import threading
import itertools
import functools
import collections
import math
try:
    from sh import cat, cd, ls
    from bs4 import BeautifulSoup
    import requests
except:
    pass
from pprint import pprint
# if 'DJANGO_SETTINGS_MODULE' in os.environ:
#     import django
#     django.setup()
