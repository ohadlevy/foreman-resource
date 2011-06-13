module Foreman
  class Hosts < Collection

    def list(filter = "")
      super(filter).map{|h| Host.new(opts.merge(:name => h.to_s))}
    end

  end
end
