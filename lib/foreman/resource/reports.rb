module Foreman
  class Reports < Resource

    def path
      "/reports"
    end

    def list(filter = "")
      get(filter).map do |r|
        Report.new(r["report"])
      end
    end

  end
end
