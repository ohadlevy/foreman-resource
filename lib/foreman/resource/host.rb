module Foreman
  class Host < Resource

    attr_reader :name

    def self.all(filter = "")
      super(filter).map{|h| self.new({:name => h.to_s})}
    end

    def initialize opts = {}
      @name = opts[:name] || raise("Must provide a name")
    end

    # our ID is the name
    def rid
      name
    end

    def to_s
      name
    end

    def facts
      Fact.all("host = #{name}")
    end

    def reports
      Report.all("host = #{name}")
    end

    def lastreport
      Report.new(get("reports/last")["report"])
    rescue RestClient::ResourceNotFound
    end
  end
end
