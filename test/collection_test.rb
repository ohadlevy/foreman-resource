class Foreman::CollectionTest < Test::Unit::TestCase
  def setup
    @resource = Foreman::Collection.new(opts)
  end

  def test_should_have_path
    assert_equal @resource.send(:path), "collection"
  end

  def test_should_respond_to_list
    assert @resource.respond_to?(:list)
  end


end
