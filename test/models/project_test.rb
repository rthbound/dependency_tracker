require "test_helper"

describe Project do
  before do
    @project = Project.create name: "Foobang", gem_home: ENV["GEM_HOME"], root_path: Rails.root
  end

  it "must have dependencies" do
    @project.dependencies.present?.must_equal true
  end

  it "must have a project root_path attribute" do
    @project.must_respond_to :root_path
    @project.must_respond_to :root_path=
  end

  it "must have a project gem_home attribute" do
    @project.must_respond_to :gem_home
    @project.must_respond_to :gem_home=
  end

end
