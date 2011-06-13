module Foreman
  class Facts < Collection

    def path
      "/fact_values"
    end

    def list(filter = "")
      response = []

      super(filter).each do |host, facts|
        facts.each do |name, value|
         response << Fact.new({:name => name, :value => value, :host => host})
        end
      end
      response.sort
    end

  end
end
