module Foreman
  class Resource

    def self.connect opts = {}
      user     = opts[:user]     || raise("Must provide User")
      password = opts[:password] || raise("Must provide Password")
      url      = opts[:url]      || raise("Must provide URL")
      headers  = { :accept => :json, :content_type => :json }

      @@resource =  RestClient::Resource.new(url, {:user => user, :password =>  password, :timeout => 60, :open_timeout => 10, :headers => headers})
    end

    def self.connection
      @@resource || raise("Must Connect First")
    end

    def self.all(filter = "")
      get(search(filter))
    rescue RestClient::ResourceNotFound
      []
    end

    def self.get(p = "")
      url = p.empty? ? path : "#{path}/#{p}"
      JSON.parse connection[URI.escape(url)].get.body
    end

    # collection path, such as foreman/hosts
    def self.path
      "#{self.to_s.downcase.gsub(/^.*::/,"")}s"
    end

    protected

    def self.search q
      return "" if q.nil? or q.empty?
      "?search=#{q}"
    end

    def rid
      Raise "Abstracted ID, must be defined per Resource class"
    end

    def get p
      url = p.empty? ? rid : "#{rid}/#{p}"
      self.class.get url
    end

  end
end
