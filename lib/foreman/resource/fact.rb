module Foreman
  class Fact
    attr_reader :name, :value, :host

    def initialize opts
      @name  = opts[:name]  || raise("Must provide a name")
      @value = opts[:value] || raise("Must provide a value")
      @host  = opts[:host]  || raise("Must provide a host")
    end

    def to_s
      "#{name} => #{value}"
    end

    def <=> other
     name <=> other.name
    end
  end
end
