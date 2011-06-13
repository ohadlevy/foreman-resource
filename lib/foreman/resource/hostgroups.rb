module Foreman
  class Hostgroups < Collection

    def list(filter = "")
      super(filter).map {|hg| Hostgroup.new(hg["hostgroup"])}
    end

  end
end
