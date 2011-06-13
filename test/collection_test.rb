class Foreman::ResourceTest < Test::Unit::TestCase
  def setup
    opts = {:url => "http://0.0.0.0:3000", :user => "admin", :password => "changeme"}

    @resource = Foreman::Collection.new(opts)
  end

  def test_should_have_path
    assert_equal @resource.send(:path), "collection"
  end

  def test_should_respond_to_list
    assert @resource.respond_to?(:list)
  end


end
