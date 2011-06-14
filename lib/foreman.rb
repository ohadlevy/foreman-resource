require 'rubygems'
require 'json'
require 'uri'
require "rest_client"

module Foreman

  autoload :Resource,   "foreman/resource"
  autoload :Host,       "foreman/resource/host"
  autoload :Fact,       "foreman/resource/fact"
  autoload :Report,     "foreman/resource/report"
  autoload :Hostgroup,  "foreman/resource/hostgroup"
  autoload :Hypervisor, "foreman/resource/hypervisor"

end
