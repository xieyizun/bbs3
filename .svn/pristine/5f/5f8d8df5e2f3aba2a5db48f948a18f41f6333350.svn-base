class PostsController < ApplicationController

  before_filter :sign_in_user

  def create
    post = current_user.posts.build(post_params(params))

    if post.save
      respond_to do |format|
        format.html
        format.js
      end
    else
      render root_path
    end

  end

  def destroy
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comment = Comment.new
  end

  private
    def post_params(params)
      params.require(:post).permit(:user_id, :content)
    end
end
