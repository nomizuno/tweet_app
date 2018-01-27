class UsersController < ApplicationController


  def index
  	@users = User.all
  end

  def new 
  	 @user = User.new

  end

  def create
  	@user =User.new(name: params[:name], 
                    email: params[:email],
                    password: params[:password],
                    image_name: "default_user.jpg"
                    )
  
  	if @user.save
      session[:user_id]=@user.id
    	redirect_to("/users/index")
    	 flash[:notice] ="登録できたよ"
    else
    	render("/users/new")
    end
  end

  def show
  	@user = User.find_by(id: params[:id])
  end

  def edit
  	@user = User.find_by(id: params[:id])
  	@user.save
  end

  def update
  	@user = User.find_by(id: params[:id])
  	@user.name = params[:name]
  	@user.email = params[:email]
    @user.password = params[:password]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end

    if @user.save
    	redirect_to("/users/index")
      flash[:notice] ="保存できたよ"
    else
    	render("/users/edit")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      flash[:notice]= "ログインしました"
      session[:user_id]=@user.id

      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email =params[:email]
      @password =params[:password]
      render("users/login_form")
    end

  end

  def logout
    session[:user_id] = nil
    redirect_to("/login")
  end

end
