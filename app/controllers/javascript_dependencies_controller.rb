class JavascriptDependenciesController < ApplicationController
  # GET /javascript_dependencies
  # GET /javascript_dependencies.json
  def index
    @project = Project.find(params[:project_id])
    @javascript_dependencies = @project.javascript_dependencies

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @javascript_dependencies }
    end
  end

  # GET /javascript_dependencies/1
  # GET /javascript_dependencies/1.json
  def show
    @javascript_dependency = JavascriptDependency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @javascript_dependency }
    end
  end

  # GET /javascript_dependencies/new
  # GET /javascript_dependencies/new.json
  def new
    @javascript_dependency = JavascriptDependency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @javascript_dependency }
    end
  end

  # GET /javascript_dependencies/1/edit
  def edit
    @javascript_dependency = JavascriptDependency.find(params[:id])
  end

  # POST /javascript_dependencies
  # POST /javascript_dependencies.json
  def create
    @javascript_dependency = JavascriptDependency.new(javascript_dependency_params)

    respond_to do |format|
      if @javascript_dependency.save
        format.html { redirect_to @javascript_dependency, notice: 'Javascript dependency was successfully created.' }
        format.json { render json: @javascript_dependency, status: :created, location: @javascript_dependency }
      else
        format.html { render action: "new" }
        format.json { render json: @javascript_dependency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /javascript_dependencies/1
  # PUT /javascript_dependencies/1.json
  def update
    @javascript_dependency = JavascriptDependency.find(params[:id])

    respond_to do |format|
      if @javascript_dependency.update_attributes(params[:javascript_dependency])
        format.html { redirect_to @javascript_dependency, notice: 'Javascript dependency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @javascript_dependency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /javascript_dependencies/1
  # DELETE /javascript_dependencies/1.json
  def destroy
    @javascript_dependency = JavascriptDependency.find(params[:id])
    @javascript_dependency.destroy

    respond_to do |format|
      format.html { redirect_to javascript_dependencies_url }
      format.json { head :no_content }
    end
  end

  private
  def javascript_dependency_params
    params.require(:javascript_dependency).permit(:name, :license, :license_description)
  end
end
