#!/usr/bin/env ruby
#
# Copyright 2017 @ bluesky Inc.
# @Author Autumn Wang
#
# Ruby OptionParser supports auto completion.
# For this example, we may run cli as:
# ./cli.rb -n 'aa' -a 23 -g m
# or
# ./cli.rb -n 'aa' -a 23 -g mal
# We always get the result with options[:gender] = 'males'
# The parameter gender was auto-completed!


require 'optparse'

options = {}
OptionParser.new do |opt|
  opt.on('-n', '--name NAME', 'Your name') { |o| options[:name] = o || ''}
  opt.on('-a', '--age AGE', 'Your age') {|o| options[:age] = (o||'0').to_i }
  opt.on('-g', '--gender GENDER', [:male, :female], 'Your gender, male or female') {|o| options[:gender] = o||''}
end.parse!

options.each {|k, v| puts "#{k.to_s.ljust(8)} : #{v}"}
