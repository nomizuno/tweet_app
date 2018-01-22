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
                    image_name: "default_user.jpg"
                    )
  
  	if @user.save
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

  def login
  end

end
