require 'foreman/resource'

module Foreman
  class Hosts < Resource

    def initialize opts = {}
      super(opts)
    end

    def path
      "/hosts"
    end

    def list(filter = "")
      get(filter).map{|h| Host.new(opts.merge(:name => h.to_s))}
    end

  end
end
