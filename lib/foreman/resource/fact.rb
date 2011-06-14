module Foreman
  class Fact < Resource
    attr_reader :name, :value, :host

    def self.all(filter = "")
      response = []

      super(filter).each do |host, facts|
        facts.each do |name, value|
         response << new({:name => name, :value => value, :host => host})
        end
      end
      response.sort
    end

    def self.path
      "/fact_values"
    end

    def initialize opts
      @name  = opts[:name]  || raise("Must provide a name")
      @value = opts[:value] || raise("Must provide a value")
      @host  = opts[:host]  || raise("Must provide a host")
    end

    def to_s
      "#{name} => #{value}"
    end

  end
end
