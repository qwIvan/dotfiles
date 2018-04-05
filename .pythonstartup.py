import os
import sys
import json
import requests
import datetime
import pickle
import glob
import re
import yaml
from sh import cat, cd, ls
from functools import lru_cache, reduce
from pprint import pprint
from bs4 import BeautifulSoup
