class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = current_user.categories.includes(:payments).order(updated_at: :desc)
  end

  def show
    respond_to do |format|
      format.html { redirect_to new_category_payment_path(@category) }
      format.json { render json: @category }
    end
  end

  def new
    @category = current_user.categories.new
  end

  def edit; end

  def create
    @category = current_user.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html do
          redirect_to params[:category][:previous_url] || category_url(@category),
                      notice: 'Category was successfully created.'
        end
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.payments.destroy_all
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = current_user.categories.find_by(id: params[:id])
    redirect_to categories_path, alert: 'Category not found.' if @category.nil?
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
