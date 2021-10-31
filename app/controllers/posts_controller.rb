class PostsController < ApplicationController
  def index
    @posts = Post.all.order(create_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
    @post = Post.new
  end

  def create
    @post = Post.new(
      shop_name: params[:shop_name],
      shop_category: params[:shop_category],
      area_name: params[:area_name],
      product_category: params[:product_category],
      comment: params[:comment],
      )
      if @post.save
        flash[:notice] = "投稿が完了しました"      
        redirect_to("/posts/index")
      else
        render("posts/new")
      end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.shop_name = params[:shop_name]
    @post.shop_category = params[:shop_category]
    @post.area_name =  params[:area_name]
    @post.product_category =  params[:product_category]
    @post.comment =  params[:comment]
    if @post.save
      flash[:notice] = "投稿を編集しました"      
      redirect_to("/posts/index")
    else
      render("posts/edit")      
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end
end
