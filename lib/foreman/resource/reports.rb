module Foreman
  class Reports < Collection

    def list(filter = "")
      super(filter).map do |r|
        Report.new(r["report"])
      end
    end

  end
end
