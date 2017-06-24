#!/usr/bin/sh

docker build -t rspec_test .
docker run -it -v "$PWD":/usr/src/app -w /usr/src/app rspec_test bundle exec rspec $@/*spec.rb

