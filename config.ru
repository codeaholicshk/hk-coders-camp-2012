#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

# require File.expand_path("../config/boot.rb", __FILE__)
# run Padrino.application

# just redirect to the new site

require 'erb'

location = 'http://hkcodecamp.github.com'
message = "<html><body>Hi, thanks for visiting Hong Kong Code Camp. Right now we're going to redirect you to <a href=\"#{ERB::Util.h(location)}\"></a>. See you over there.</body></html>"

run lambda { |env| [301, { 'Content-Type' => 'text/html', 'Location' => location }, [message]] }
