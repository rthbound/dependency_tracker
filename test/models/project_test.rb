require "test_helper"

describe Project do
  before do
    @project = Project.create name: "Foobang", gem_home: ENV["GEM_HOME"]
  end

  it "must have dependencies" do
    @project.dependencies.present?.must_equal true
  end
end
