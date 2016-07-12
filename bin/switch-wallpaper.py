#!/bin/env python3
from argparse import ArgumentParser
from PIL import Image
from os import system, remove as move
from os.path import expanduser, join
from hashlib import md5
from urllib.request import urlretrieve


def attempt_size():
    if args.resolution:
        args_w = int(args.resolution.split('x')[0])
        args_h = int(args.resolution.split('x')[1])
        if args_h*1.5 > args_w:
            width = args_h*1.5
            height = args_h
        else:
            width = args_w - args_w % 3 + 3
            height = width/3*2
    elif args.width:
        width = args.width - args.width % 3 + 3
        height = width/3*2
    elif args.height:
        width = args.height*1.5
        height = args.height
    else:
        width = DEFAULT_WIDTH
        height = DEFAULT_HEIGHT
    return width, height


DEFAULT_WIDTH = 3286 - 3286 % 3 + 3
DEFAULT_HEIGHT = DEFAULT_WIDTH/3*2
parser = ArgumentParser('Switching wallpapaer randomly.')
resolution_group = parser.add_mutually_exclusive_group()
resolution_group.add_argument('-r', '--resolution', metavar='resolution', help='[width]x[height]')
resolution_group.add_argument('-W', '--width', help='width of screen', metavar='width', type=int)
resolution_group.add_argument('-H', '--height', help='height of screen', metavar='width', type=int)
args = parser.parse_args()
DOWN_PAPER = expanduser('~/wallpaper~')
PAPER_DIR = expanduser('~/wallpapers')
WIDTH, HEIGHT = attempt_size()
RANDOM_URL = 'https://unsplash.it/%d/%d/?random' % (WIDTH, HEIGHT)
try:
    with Image.open(DOWN_PAPER) as im:
        IMAGE_WIDTH, IMAGE_HEIGHT = im.size
    code = system('feh --bg-fill --no-xinerama ' + DOWN_PAPER)
    if code == 0:
        md5 = md5(open(DOWN_PAPER, 'rb').read()).hexdigest()
        move(DOWN_PAPER, join(PAPER_DIR, '%s-%dx%d' % (md5, IMAGE_WIDTH, IMAGE_HEIGHT)))
except:
    print('t')
    system('feh --bg-fill --randomize --no-xinerama ' + join(PAPER_DIR, '*-%dx%d' % (WIDTH, HEIGHT)))
urlretrieve(RANDOM_URL, DOWN_PAPER)
