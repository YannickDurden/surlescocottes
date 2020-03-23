#!/bin/bash

echo ------------
echo Starting build..
echo ------------
JEKYLL_ENV=production bundle exec jekyll build
echo ------------

echo Sending site..
echo ------------
scp -r _site pi@192.168.1.49:/home/pi
echo ------------

echo et voilà!