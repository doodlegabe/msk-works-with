class DevelopersController < ApplicationController

  before_action :set_developer, only: [:show, :edit, :update, :destroy]

  def index
    add_breadcrumb 'Home', home_path
    add_breadcrumb 'Developers', developers_path
    @developers = Developer.all.where(is_live: true)
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @developers}
    end
  end

  def show
    add_breadcrumb 'Home', home_path
    add_breadcrumb 'Developers', developers_path
    add_breadcrumb @developer.name, developer_path(@developer.slug)

    @developer_works_withs = []

    @developer.apps.each do |app|
      w = WorksWith.all.where(app_id: app.id)
      w.each do |ww|
        @developer_works_withs.append(ww)
      end
    end

    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @developer}
    end
  end

  def new
    @developer = Developer.new
  end

  def edit
  end

  def create
    @developer = Developer.new(developer_params)
    respond_to do |format|
      if @developer.save
        format.html { redirect_to @developer, notice: 'Developer was successfully created.' }
        format.json { render :show, status: :created, location: @developer }
      else
        format.html { render :new }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @developer.update(developer_params)
        format.html { redirect_to @developer, notice: 'Developer was successfully updated.' }
        format.json { render :show, status: :ok, location: @developer }
      else
        format.html { render :edit }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @developer.destroy
    respond_to do |format|
      format.html { redirect_to developers_url, notice: 'Developer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_developer
    @developer = Developer.find(params[:slug])
  end

  def developer_params
    params.require(:developer).permit(:name, :description, :url, :is_live, :logo_image_url, :slug)
  end
end