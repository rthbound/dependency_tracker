require File.expand_path('../../test_helper', __FILE__)
require File.expand_path('../../../app/models/use_case', __FILE__)

describe UseCase::JavascriptDependenciesIndex::Create do
  describe "when executed" do
    before do
      @subject = UseCase::JavascriptDependenciesIndex::Create
      @project = Project.new(name: "Foo", gem_home: ENV["GEM_HOME"], root_path: Rails.root.to_s)
      @dependency_creator_class = UseCase::JavascriptDependenciesIndex::CreateJavascriptDependencies

      @dir = mock("Dir")
      @file = mock("File")
      @js_dependency_sources = mock("JS Dependency Sources")

      @dir.expects(:glob).returns(@js_dependency_sources).once
      @js_dependency_sources.expects(:each).returns(@js_dependency_sources).once

      @project.expects(:save).returns(true).once

      @use_case = @subject.new(project: @project, dir_class: @dir, dependency_class: @dependency_class, dependency_creator_class: @dependency_creator_class, file_class: @file)
    end


    it "should return a UseCase::Result class when successful" do
      use_case_result = @use_case.execute!
      use_case_result.successful?.must_equal true
      use_case_result.must_be_kind_of UseCase::Result
    end
  end
end
