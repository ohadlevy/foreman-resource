#!/usr/bin/ruby

$LOAD_PATH.unshift *Dir["#{File.dirname(__FILE__)}/lib"]

require "foreman"

opts = {:url => "http://0.0.0.0:3000", :user => "admin", :password => "changeme"}

Foreman::Resource.connect(opts)

hosts = Foreman::Host.all

puts hosts

host = Foreman::Host.all("name ~ g").first
puts host

puts "querying for #{host} facts"
puts host.facts

puts "querying host reports"
puts host.reports

puts host.lastreport


hg = Foreman::Hostgroup.all
puts hg.first
