# frozen_string_literal: true

class UserListsController < ApplicationController
  before_action :set_user_list, only: [:show, :edit, :update, :destroy, :choose_products, :save_product, :add_product, :remove_product]

  def index
    @user_lists = UserList.all
  end

  def show
    products_id = @user_list.product_user_lists.select(:product_id).map(&:product_id)
    choose_products(products_id)
  end

  def new
    @user_list = UserList.new
  end

  def edit
  end

  def choose_products(products_id = nil)
    @category_and_subcategories = Category.select(:id, :description).includes(:subcategories)

    @collection = Product.get_products(
      params.slice(:subcategory_id, :q).merge(
        user_list_id: @user_list.id,
        products_id: products_id
      )
    )

    @collection = @collection.paginate(
      page: params[:page],
      per_page: 8,
      total_entries: @collection.size
    )
  end

  def save_product
    product_user_list = @user_list.product_user_lists.create(product_id: params[:product][:id], quantity: 1)
    @quantity = product_user_list.quantity
  end

  def add_product
    product_user_list = ProductUserList.where(user_list_id: @user_list.id, product_id: params[:product][:id]).first
    product_user_list.update(quantity: product_user_list.quantity + 1)
    @quantity = product_user_list.quantity
  end

  def remove_product
    product_user_list = ProductUserList.where(user_list_id: @user_list.id, product_id: params[:product][:id]).first
    @quantity = product_user_list.quantity - 1

    if @quantity.zero?
      product_user_list.destroy
    else
      product_user_list.update(quantity: @quantity)
    end
  end

  def create
    @user_list = UserList.new(user_list_params)

    respond_to do |format|
      if @user_list.save
        format.html { redirect_to @user_list, notice: 'User list was successfully created.' }
        format.json { render :show, status: :created, location: @user_list }
      else
        format.html { render :new }
        format.json { render json: @user_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_list.update(user_list_params)
        format.html { redirect_to @user_list, notice: 'User list was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_list }
      else
        format.html { render :edit }
        format.json { render json: @user_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_list.destroy
    respond_to do |format|
      format.html { redirect_to user_lists_url, notice: 'User list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user_list
    @user_list = UserList.find(params[:id])
  end

  def user_list_params
    params.require(:user_list).permit(:name, :notes, :user_id)
  end
end
