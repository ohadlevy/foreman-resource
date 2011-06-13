require 'rubygems'
require 'json'
require 'uri'
require "rest_client"

module Foreman

  autoload :Resource, "foreman/resource"
  autoload :Host, "foreman/resource/host"
  autoload :Hosts, "foreman/resource/hosts"
  autoload :Facts, "foreman/resource/facts"
  autoload :Fact, "foreman/resource/fact"
  autoload :Reports, "foreman/resource/reports"
  autoload :Report, "foreman/resource/report"

end
