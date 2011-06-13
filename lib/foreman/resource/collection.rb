module Foreman
  class Collection < Resource

    protected

    def path
      "#{self.class.to_s.downcase.gsub(/^.*::/,"")}"
    end

    def list(filter = "")
      get(search(filter))
    rescue RestClient::ResourceNotFound
      []
    end

  end
end
