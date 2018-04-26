class UsersController < ApplicationController
  include UsersHelper
  skip_before_action :verify_authenticity_token
  before_action :min_pass_length, only: %i[new edit create update]
  before_action :user_define, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    unless role_name.empty?
      @user.add_role role_name
    end
    if @user.save
      flash[:notice] = t('.successfully_create')
      redirect_to users_path
    else
      flash[:alert] = t('.didn_t_create')
      render :new
    end
  end

  def edit
  end

  def update
    all_roles.each{ |role| @user.remove_role role }
    unless role_name.empty?
      @user.add_role role_name
    end
    if @user.update(user_params)
      redirect_to users_path
      flash[:notice] = t('.successfully_update')
    else
      flash[:alert] = t('.didn_t_update')
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :surname, :email, :password)
    end

    def user_define
      @user = User.find(params[:id])
    end

    def min_pass_length
      @minimum_password_length = User.password_length.min
    end

    def role_name
      params.require(:user).permit(:roles)[:roles]
    end
end
