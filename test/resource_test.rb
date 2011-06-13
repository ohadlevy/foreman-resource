class Foreman::ResourceTest < Test::Unit::TestCase
  def setup
    @resource = Foreman::Resource.new(opts)
  end

  def test_should_have_connection_opts
    [:user, :password, :url].each do |o|
      assert_not_nil @resource.send(o)
    end
  end

  def test_search_url_should_not_contain_spaces
    assert @resource.send(:search,"a = b") =~ /^\?search=/
  end


end
