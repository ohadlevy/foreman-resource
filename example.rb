#!/usr/bin/ruby

$LOAD_PATH.unshift *Dir["#{File.dirname(__FILE__)}/lib"]

require "foreman"

opts = {:url => "http://0.0.0.0:3000", :user => "admin", :password => "changeme"}

hosts = Foreman::Hosts.new(opts)
puts hosts.list

host = hosts.list("name ~ g").first

puts "querying for #{host} facts"
puts host.facts

puts "querying host reports"
puts host.reports

puts host.lastreport


hg = Foreman::Hostgroups.new(opts).list
puts hg.first
