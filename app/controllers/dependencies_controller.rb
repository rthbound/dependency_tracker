class DependenciesController < ApplicationController
  # GET /dependencies
  # GET /dependencies.json
  def index
    @dependencies = Dependency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dependencies }
    end
  end

  # GET /dependencies/1
  # GET /dependencies/1.json
  def show
    @dependency = Dependency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dependency }
    end
  end

  # GET /dependencies/new
  # GET /dependencies/new.json
  def new
    @dependency = Dependency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dependency }
    end
  end

  # GET /dependencies/1/edit
  def edit
    @dependency = Dependency.find(params[:id])
  end

  # POST /dependencies
  # POST /dependencies.json
  def create
    @dependency = Dependency.new(params[:dependency])

    respond_to do |format|
      if @dependency.save
        format.html { redirect_to @dependency, notice: 'Dependency was successfully created.' }
        format.json { render json: @dependency, status: :created, location: @dependency }
      else
        format.html { render action: "new" }
        format.json { render json: @dependency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dependencies/1
  # PUT /dependencies/1.json
  def update
    @dependency = Dependency.find(params[:id])

    respond_to do |format|
      if @dependency.update_attributes(params[:dependency])
        format.html { redirect_to @dependency, notice: 'Dependency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dependency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dependencies/1
  # DELETE /dependencies/1.json
  def destroy
    @dependency = Dependency.find(params[:id])
    @dependency.destroy

    respond_to do |format|
      format.html { redirect_to dependencies_url }
      format.json { head :no_content }
    end
  end

  def approve
    @dependency = Dependency.find(params[:id])

    @dependency.update_attribute(:approved, true)

    render nothing: true
  end
end
