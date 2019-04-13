class UsersController < ApplicationController

  before_action :set_user, only: [:update]
  before_action :auth_user, {only: [:index, :show]}
  before_action :login_user, {only: [:new, :create, :login_form, :login]}
  before_action :correct_user, {only: [:edit, :update]}
  before_action :test_user, only: [:destroy]

  def index
  end

  def new
  	@user = User.new
  end


  def create
  	@user = User.new(user_params)
    
  	if @user.save
      session[:user_id] = @user.id
  		flash[:notice] = "ユーザー登録が完了しました"
  		redirect_to('/posts/index')
  	else
  		render("/users/new")
  	end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    # @user.name = params[:name]
    # @user.email = params[:email]
    # @user.password = params[:password]

    # 画像処理
    # if params[:image]
    #   @user.image_name = "#{@user.id}.jpg"
    #   image = params[:image]
    #   File.binwrite("public/user_images/#{@user.image_name}",image.read)
    # end
    @user.image.purge
    @user.image.attach(params[:image])

    @user.update(user_params)
    flash[:notice] = "ユーザー編集が完了しました！"
    redirect_to("/users/#{@user.id}")
  end

  def destroy 
    @user = User.find_by(id: params[:id])
    @posts = Post.find_by(user_id: params[:id])
    flash[:notice] = "ユーザーを削除しました！"

    if @posts.nil?
      @user.destroy
      redirect_to("/")
    else
      @posts.destroy
      @user.destroy
      redirect_to("/")
    end
    
  end


  def show
    @user = User.find_by(id:params[:id])
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.name}さんこんにちは！"
      redirect_to("/posts/index")
    else
      @error = "ユーザーが見つかりませんでした！"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました！"
    redirect_to("/login")
  end

  def correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません！"
      redirect_to("/posts/index")
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:image)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def test_user
    if @current_user.name == "test"
      flash[:notice] = "テストユーザーではこの機能は使用できません"
      redirect_to("/users/#{@current_user.id}")
    end
  end

end
