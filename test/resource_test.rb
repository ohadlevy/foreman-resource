class Foreman::ResourceTest < Test::Unit::TestCase

  def test_should_have_path
    assert_equal Foreman::Resource.path, "resources"
  end

  def test_should_respond_to_list
    assert Foreman::Resource.all
  end

  def test_search_url_should_not_contain_spaces
    assert Foreman::Resource.send(:search,"a = b") =~ /^\?search=/
  end


end
