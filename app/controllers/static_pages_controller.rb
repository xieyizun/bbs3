class StaticPagesController < ApplicationController
  def home
    @posts = Post.all.paginate(page: params[:page], per_page: 10)
  end

  def error
    render 'error'
  end

=begin
    respond_to do |format|
      format.html { redirect_to signin_path }
      format.js { render :json => { :signin => "<a href='#'>Sign in</a>", :signup => "<a href='#'>Sign up</a>" } }
    end
=end
end
