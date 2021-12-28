#!/bin/bash

set -e

echo 'Installing the gem bundle...'
bundle install

echo 'Building the site...'
bundle exec jekyll build

echo ${GITHUB_ACTOR} ${GITHUB_REPOSITORY}

echo 'Pushing it back to gh-pages repository...'
remote_repo="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" && \
cd _site && \
git init && \
git config --global init.defaultBranch main && \
git config user.name "${GITHUB_ACTOR}" && \
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com" && \
git remote add origin $remote_repo && \
echo "commiting" &&\
git add . && \
git commit -m 'action build - $(date)' > /dev/null 2>&1 && \
echo "pushing" &&\
git push --force -u origin main:gh-pages > /dev/null 2>&1 && \
echo "done"

rm -rf .git
cd ..
rm -rf _site

echo 'Deploy job done'