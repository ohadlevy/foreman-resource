require "test/unit"
$LOAD_PATH.unshift *Dir["#{File.dirname(__FILE__)}/../lib"]
require "foreman"

class Test::Unit::TestCase
  def setup
  opts = {:url => "http://0.0.0.0:3000", :user => "admin", :password => "changeme"}
  Foreman::Resource.connect(opts)
  end
end
