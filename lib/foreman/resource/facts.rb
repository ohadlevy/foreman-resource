module Foreman
  class Facts < Resource

    def path
      "/fact_values"
    end

    def list(filter = "")
      response = []

      get(filter).each do |host, facts|
        facts.each do |name, value|
         response << Fact.new({:name => name, :value => value, :host => host})
        end
      end
      response
    end

  end
end
