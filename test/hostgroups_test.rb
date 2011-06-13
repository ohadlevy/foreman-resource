class Foreman::HostGroupsTest < Test::Unit::TestCase
  def setup
    @resource = Foreman::Hostgroups.new(opts)
  end

  def test_path
    assert_equal @resource.send(:path), "hostgroups"
  end

  def test_list_should_create_hostgroup_objects
    assert @resource.list.first.is_a?(Foreman::Hostgroup)
  end

end
