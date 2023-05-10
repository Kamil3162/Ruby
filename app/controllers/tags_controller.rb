class TagsController < ApplicationController
  before_action :set_product
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @tags = @product.tags
  end

  def new
    @tag = @product.tags.build
  end

  def create
    @tag = @product.tags.build(tag_params)
    if @tag.save
      redirect_to product_tags_path(@product), notice: "Tag was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to product_tags_path(@product), notice: "Tag was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to product_tags_path(@product), notice: "Tag was successfully deleted."
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_tag
    @tag = @product.tags.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end

