class Foreman::HostGroupTest < Test::Unit::TestCase
  def setup
    super
    @hostgroup = Foreman::Hostgroup.new(:name => "test", :id => 1)
    @attr = [:name, :id]
  end

  def test_path
    assert_equal Foreman::Hostgroup.path, "hostgroups"
  end

  def test_list_should_create_hostgroup_objects
    assert Foreman::Hostgroup.all.first.is_a?(Foreman::Hostgroup)
  end
  def test_should_have_attributes
    @attr.each do |o|
      assert_not_nil @hostgroup.send(o)
    end
  end

  def test_should_have_a_name
    assert_equal @hostgroup.name, "test"
  end

  def test_should_have_list_of_hosts
    assert Foreman::Hostgroup.all.first.hosts.first.is_a? Foreman::Host
  end

end
