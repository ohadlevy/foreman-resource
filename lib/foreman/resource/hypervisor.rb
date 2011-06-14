module Foreman
  class Hypervisor < Resource

    attr_reader :name, :kind, :uri

    def self.all(filter = "")
      super(filter).map{|h| self.new(h["hypervisor"])}
    end

    def initialize opts = {}
      opts.each do |k,v|
        eval("@#{k} = v") if self.respond_to?(k)
      end
    end

    # our ID is the name
    def rid
      name
    end

    def to_s
      name
    end

  end
end
