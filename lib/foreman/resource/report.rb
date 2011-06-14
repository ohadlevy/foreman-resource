require 'time'

module Foreman
  class Report < Resource
    attr_reader :status, :metrics, :summary, :value, :host, :reported_at, :id, :logs

    def self.all(filter = "")
      super(filter).map do |r|
        Report.new(r["report"])
      end.sort
    end

    def initialize opts
      # Generic class assignment
      @reported_at = Time.parse(opts.delete("reported_at"))
      opts.each do |k,v|
        eval("@#{k} = v") if self.respond_to?(k)
      end
    end

    def to_s
      "#{host}: #{reported_at} => #{summary}"
    end

    def rid
      id
    end

    def <=> other
      reported_at <=> other.reported_at
    end
  end
end
