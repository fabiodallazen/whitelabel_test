# frozen_string_literal: true

class UserListsController < ApplicationController
  before_action :set_user_list, only: %i[show edit update destroy choose_products save_product add_product remove_product]

  def index
    @user_lists = UserList.where(user: current_user).all
  end

  def show
    products_id = ProductUserList.where(user_list_id: @user_list.id).select(:product_id).map(&:product_id)
    choose_products(products_id)
  end

  def new
    @user_list = UserList.new
  end

  def edit; end

  def choose_products(products_id = nil)
    @category_and_subcategories = Category.select(:id, :description).includes(:subcategories)

    @collection = Product.get_products(
      params.slice(:subcategory_id, :q).merge(user_list_id: @user_list.id, products_id: products_id)
    )

    @collection = @collection.paginate(
      page: params[:page],
      per_page: 8,
      total_entries: @collection.size
    )

    flash[:notice] = params.delete(:mesage)
  end

  def save_product
    @quantity = ProductUserList.save(@user_list.id, params[:product][:id], 1)
    @quantity_product_user_lists = ProductUserList.where(user_list: @user_list).count
  end

  def add_product
    @quantity = ProductUserList.save(@user_list.id, params[:product][:id], 1)
    @quantity_product_user_lists = ProductUserList.where(user_list: @user_list).count
  end

  def remove_product
    @quantity = ProductUserList.save(@user_list.id, params[:product][:id], -1)
    @quantity_product_user_lists = ProductUserList.where(user_list: @user_list).count
  end

  def create
    @user_list = UserList.new(user_list_params)

    respond_to do |format|
      if @user_list.save
        format.html { redirect_to action: :choose_products, id: @user_list.id, mesage: 'A lista de usuários foi criada com sucesso.' }
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
        format.html { redirect_to @user_list, notice: 'A lista de usuários foi atualizada com sucesso.' }
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
      format.html { redirect_to user_lists_url, notice: 'A lista de usuários foi destruída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user_list
    @user_list = UserList.find_by(user: current_user, id: params[:id])
  end

  def user_list_params
    params.require(:user_list).permit(:name, :notes, :user_id)
  end
end