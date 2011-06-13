require 'time'

module Foreman
  class Report
    attr_reader :status, :metrics, :summary, :value, :host, :reported_at, :id, :logs

    def initialize opts
      # Generic class assignment
      @reported_at = Time.parse(opts.delete("reported_at"))
      opts.each do |k,v|
        raise("Must provide a #{k}") unless self.respond_to?(k)
        eval("@#{k} = v")
      end
    end

    def to_s
      "#{host}: #{reported_at} => #{summary}"
    end
  end
end
