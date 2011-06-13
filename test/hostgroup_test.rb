class Foreman::HostGroupTest < Test::Unit::TestCase
  def setup
    @hostgroup = Foreman::Hostgroup.new(:name => "test", :id => 1)
    @attr = [:name, :id]
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
    assert Foreman::Hostgroups.new(opts).list.first.hosts.first.is_a? Foreman::Host
  end

end
