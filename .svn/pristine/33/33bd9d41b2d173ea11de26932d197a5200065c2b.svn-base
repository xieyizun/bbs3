module PostsHelper

  def set_current_post(post)
    session[:remember_token2] = post.remember_token2
    self.current_post = post
  end

  def current_post=(post)
    @current_post = post
  end

  def current_post
    @current_post ||= Post.find_by_remember_token2(session[:remember_token2])
  end

end
