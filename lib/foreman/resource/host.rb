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
      Facts.new(opts).list("?search = host = #{name}")
    end

    def reports
      Reports.new(opts).list("?search = host = #{name}")
    end

    def lastreport
      Report.new(get("reports/last")["report"])
    end
  end
end
