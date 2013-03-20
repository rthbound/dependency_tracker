require File.expand_path('../../test_helper', __FILE__)
require File.expand_path('../../../app/models/use_case', __FILE__)

describe UseCase::DependenciesIndex::Create do
  describe "when executed" do
    before do
      @subject = UseCase::DependenciesIndex::Create
      @project = Project.new(name: "Foo", gem_home: ENV["GEM_HOME"])
      @dependency_class = mock("Dependency Class")

      @dir = mock("Dir")
      @find = mock("Find")
      @glob = mock("a glob")

      @dir.expects(:glob).returns(@glob).once
      @glob.expects(:each).returns(@glob).once
      @project.expects(:save).returns(true).once
      @use_case = @subject.new(project: @project, dir_class: @dir, find_class: @find, dependency_class: @dependency_class)
    end


    it "should return a UseCase::Result class when successful" do
      use_case_result = @use_case.execute!
      use_case_result.successful?.must_equal true
      use_case_result.must_be_kind_of UseCase::Result
    end
  end
end
