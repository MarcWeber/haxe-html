#!/bin/sh
mkdir -p release/haxe-html
git archive --format=zip HEAD > haxe-html.zip
rm -fr release
mkdir -p release/haxe-html
(
  set -x
  cd release/haxe-html
  unzip ../../haxe-html.zip
  rm ../../haxe-html.zip
  cd ..
  rm haxe-html/.gitignore
  zip -r ../haxe-html.zip .
)
