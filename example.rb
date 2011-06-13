#!/usr/bin/ruby

$LOAD_PATH.unshift *Dir["#{File.dirname(__FILE__)}/lib"]

require "foreman"

opts = {:url => "http://0.0.0.0:3000", :user => "admin", :password => "changeme"}

# Generic resource examp
foreman = Foreman::Resource.new(opts)
puts foreman.get("hosts")

hosts = Foreman::Hosts.new(opts)
puts hosts.list.map
host = hosts.list("?search=name ~ g").first

puts "querying for #{host} facts"
p host.facts