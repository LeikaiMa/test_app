class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: :destroy
  def index
    @users = User.paginate(page: params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @users }
      format.json { render json: @users }
    end
  end
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @user }
      format.json { render json: @user }
    end
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Time Bank!"
      respond_to do |format|
        format.html { redirect_to @user }
        format.xml  { render xml: @user }
        format.json { render json: @user }
      end
      
    else
      render 'new'
    end
  end

  def edit
   

  end

  def update
   
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      # redirect_to @user
      respond_to do |format|
        format.html { redirect_to @user }
        format.xml  { render xml: @user }
        format.json { render json: @user }
      end
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"  
    # redirect_to users_url
    respond_to do |format|
        format.html { redirect_to users_url }
        format.xml  { render xml: @user }
        format.json { render json: @user }
    end
  end

  def following
    @title = "Tasks from"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Tasks to"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)

    end

    # before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
    def signed_in_user
      redirect_to signin_url, notice:"Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
