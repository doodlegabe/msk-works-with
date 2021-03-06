class WorksWithsController < ApplicationController

  before_action :set_works_with, only: [:show, :edit, :update, :destroy]

  def index
    add_breadcrumb 'Home', home_path
    add_breadcrumb 'Works with MOLESKINE', works_withs_path
    @page_title = t('pages.works_with.meta.title')
    @page_description = t('pages.works_with.meta.description')
    @page_keywords = t('pages.works_with.meta.keywords')
    @works_withs = WorksWith.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @works_withs}
    end
  end

  def show
    add_breadcrumb 'Home', home_path
    add_breadcrumb 'Works with MOLESKINE', works_withs_path
    add_breadcrumb  @works_with.title, works_with_path(@works_with.slug)
    #ToDo: When more content is available this should use UseCase to build related works with
    @page_title = @works_with.meta_title
    @page_description = @works_with.meta_description
    @page_keywords = @works_with.meta_keywords
    @related_works_with = WorksWith.all.last(3)
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @works_with}
    end
  end

  def new
    @works_with = WorksWith.new
  end

  def edit
  end

  def create
    @works_with = WorksWith.new(works_with_params)
    respond_to do |format|
      if @works_with.save
        format.html { redirect_to @works_with, notice: 'WorksWith was successfully created.' }
        format.json { render :show, status: :created, location: @works_with }
      else
        format.html { render :new }
        format.json { render json: @works_with.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @works_with.update(works_with_params)
        format.html { redirect_to @works_with, notice: 'WorksWith was successfully updated.' }
        format.json { render :show, status: :ok, location: @works_with }
      else
        format.html { render :edit }
        format.json { render json: @works_with.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @works_with.destroy
    respond_to do |format|
      format.html { redirect_to works_withs_url, notice: 'WorksWith was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_works_with
    @works_with = WorksWith.find_by(slug: params[:slug])
  end

  def works_with_params
    params.require(:works_with).permit(:title, :description, :app_id, :product_id, :is_live, :promo_image_url, :promo_text, :slug, :meta_title, :meta_keywords, :meta_description)
  end
end