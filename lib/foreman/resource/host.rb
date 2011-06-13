require 'foreman/resource'
require 'foreman/resource/hosts'

module Foreman
  class Host < Resource

    attr_reader :name

    def initialize opts = {}
      @name = opts[:name] || raise("Must provide a name")
      super(opts)
    end

    def path
      "/hosts/#{name}"
    end

    def to_s
      name
    end

    def facts
      get("facts")
    end

    def reports
      get("reports")
    end
  end
end
