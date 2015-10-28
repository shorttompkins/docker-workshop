# this is a comment
FROM ubuntu:14.04
MAINTAINER Jason Krol <jkrol@dramafever.com>
# each run statement is a layer - so using a long complex run
# command is good for a single layer:
RUN apt-get update && apt-get install -y ruby ruby-dev
RUN gem install sinatra
