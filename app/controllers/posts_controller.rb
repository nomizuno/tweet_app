class PostsController < ApplicationController

  def new
    @post = Post.new
  end
  
  def create
  	@post=Post.new(content: params[:content],
                    user_id: @current_user.id)
    @post.save
  if @post.save
      #保存できた場合
      redirect_to("/posts/index")
      flash[:notice] ="投稿できたよ"
    else
      render("/posts/new")
    end
  end

  def edit
  	@post = Post.find_by(id: params[:id])
  	@post.save
  end

  def update
  	@post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    if @post.save
      #保存できた場合
      redirect_to("/posts/index")
      flash[:notice] ="保存できたよ"
    else
      render("/posts/edit")
    end
  end

    def destroy
     @post =Post.find_by(id: params[:id])
     @post.destroy
     flash[:notice]="消えちゃった、、、"
     redirect_to("/posts/index")
   end


   def index
     @posts = Post.all.order(created_at: :desc)

   end

   def show
     @post = Post.find_by(id: params[:id])
     @user = User.find_by(id: @post.user_id)
   end

 end


