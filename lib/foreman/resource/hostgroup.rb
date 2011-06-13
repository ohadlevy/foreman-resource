module Foreman
  class Hostgroup

    attr_reader :name, :id

    def initialize opts = {}
      opts.each do |k,v|
        eval("@#{k} = v") if self.respond_to?(k)
      end

      {:name => name, :id => id}.each do |k,v|
        raise("Must provide a #{k}") if v.nil?
      end

    end

    def path
      "/hostgroups/#{id}"
    end

    def to_s
      name
    end

    def hosts
      Hosts.new(opts).list("hostgroup = #{name}")
    end

  end
end
