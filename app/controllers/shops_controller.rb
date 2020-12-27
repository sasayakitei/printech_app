class ShopsController < ApplicationController
  before_action :require_signed_in, only: [:new, :create, :edit]

  def index
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:notice] = 'ショップが登録されました'
      redirect_to root_path
    else
      flash.now[:alert] = '登録エラーです'
      render :new
    end
  end

  def edit
  end

  def show
  end

  private
    def require_signed_in
      unless user_signed_in?
        flash[:alert] = 'サインインが必要です'
        redirect_to root_path
      end
    end

    def shop_params
      params.require(:shop).permit(:name, :description, :website_url, :email, :phone_number)
    end
end
