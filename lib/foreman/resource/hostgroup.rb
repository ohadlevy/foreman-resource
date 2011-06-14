module Foreman
  class Hostgroup < Resource

    attr_reader :name, :id

    def self.all(filter = "")
      super(filter).map {|hg| Hostgroup.new(hg["hostgroup"])}
    end

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

    def rid
      id
    end

    def to_s
      name
    end

    def hosts
      Host.all("hostgroup = #{name}")
    end

  end
end
