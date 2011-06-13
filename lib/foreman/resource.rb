module Foreman
  class Resource

    attr_reader :user, :password, :url, :resource

    def initialize opts = {}
      @user     = opts[:user]     || raise("Must provide User")
      @password = opts[:password] || raise("Must provide Password")
      @url      = opts[:url]      || raise("Must provide URL")

      @resource =  RestClient::Resource.new(url, {:user => user, :password =>  password, :timeout => 60, :open_timeout => 10, :headers => headers})
    end

    def opts
      {:url => url, :user => user, :password => password}
    end

    def headers
       { :accept => :json, :content_type => :json }
    end

    def path
      "/"
    end

    def get(p = "")
      url = p.empty? ? path : "#{path}/#{p}"
      JSON.parse resource[URI.escape(url)].get.body
    end
  end
end
