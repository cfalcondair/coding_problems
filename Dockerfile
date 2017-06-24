FROM ruby:latest

# Install bundler and the "bundle" shim
RUN gem install bundler

RUN gem install rspec
