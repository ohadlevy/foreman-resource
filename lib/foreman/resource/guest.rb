module Foreman
  class Hypervisor::Guest < Resource

    attr_reader :name, :vcpu, :memory, :running, :hypervisor

    def self.all opts = {}
      @hypervisor = opts[:hypervisor] || raise("Must define a hypervisor")
      super.map{|g| self.new(g.merge(opts))}
    end

    def initialize opts = {}
      @hypervisor = opts.delete(:hypervisor)
      opts.each do |name,attrs|
        @name = name
        attrs.each do |k,v|
          eval("@#{k} = v") if self.respond_to?(k)
        end
      end
    end

    def self.path
      "hypervisors/#{@hypervisor}/guests"
    end

    # our ID is the name
    def rid
      "#{hypervisor}/#{guest}"
    end

    def to_s
      name
    end

    def pp
      "#{name}: VCPU => #{vcpu}, memory => #{memory}, running => #{running} hypervisor => #{hypervisor}"
    end

  end
end
