class UsersController < ApplicationController
  load_and_authorize_resource

  layout 'form', only: ["new", "create"]

  def index
    #@users = User.all

    render json: @users 
  end

  def show
    #@user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @new }
    end
  end

  def new
    #@user = User.new

    respond_to do |format|
      format.html
      format.json { render json: @new }
    end
  end

  def edit
    #@user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def create
    #@user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        auto_login(@user, params[:user][:remember_me])
        format.html { redirect_to root_url, notice: "Signed up!" }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@user = User.find(params[:id])

    if params[:user][:password] && params[:user][:password].empty?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to root_url, notice: "Updated!" }
        format.json { render json: @user, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@user = User.find(params[:id])
    @user.destroy

    render json: @user, status: :ok
  end
end
