#!/bin/bash

set -e

echo 'Installing the gem bundle...'
#bundle install

echo 'Building the site...'
#bundle exec jekyll build

echo ${GITHUB_ACTOR} ${GITHUB_REPOSITORY}



echo 'Deploy job done'