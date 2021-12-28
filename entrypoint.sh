#!/bin/bash

echo 'Installing the gem bundle...'
bundle install

echo 'Building the site...'
bundle exec jekyll build

echo 'Pushing it back to gh-pages repository...'
cd build
remote_repo="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" && \
remote_branch="gh-pages" && \
git init && \
git config user.name "${GITHUB_ACTOR}" && \
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com" && \
git add . && \
git commit -m 'action build' > /dev/null 2>&1 && \
git push --force $remote_repo main:$remote_branch > /dev/null 2>&1 && \
rm -rf .git && \

echo 'Deploy job done'