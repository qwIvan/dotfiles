import logging
import os
import sys
import json
import requests
import datetime
import pickle
import glob
import re
try:
    from sh import cat, cd, ls
    from functools import lru_cache, reduce
    from bs4 import BeautifulSoup
except:
    pass
from pprint import pprint
