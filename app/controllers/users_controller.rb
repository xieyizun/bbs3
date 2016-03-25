class UsersController < ApplicationController


  before_filter :sign_in_user, only: [:index, :edit, :update, :show, :destroy]
  before_filter :correct_user, only: [:edit, :update, :show]
  before_filter :is_admin, only: [:index]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = 'register successfully'
      sign_in @user
      redirect_to @user

    else
      flash[:error] = "#{ @user.errors.full_messages }"
      render 'new'

    end
  end

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def edit
  end

  def update
    @user = User.find_by_id(current_user.id)

    old_password = params[:old_password]

    if !old_password.empty?
      if !@user.authenticate(old_password)
        flash[:error] = '原始密码错误'
        render 'edit'
        return
      else
        password = params[:user][:password]
        password_confirmation = params[:user][:password_confirmation]

        if !password.empty?
          if !password == password_confirmation
            flash[:error] = '前后两次输入密码不一致'
            render 'edit'
            return
          else
            if !@user.update_attribute :password, password
              flash[:error] = '更新密码失败'
              render 'edit'
              return
            end
          end
        else
          flash[:error] = '新密码不能为空'
          render 'edit'
          return
        end
      end
    end

    name = params[:user][:name]
    email = params[:user][:email]

    if !name.empty? && !(name == @user.name)
      if !@user.update_attribute :name, name
        flash[:error] = '更新用户名失败'
        render 'edit'
        return
      end
    end

    if !email.empty? && !(email == @user.email)
      if !@user.update_attribute :email, email
        flash[:error] = '更新邮箱失败'
        render 'edit'
        return
      end
    end

    #更新用户后,current_user失效
    sign_in @user

    redirect_to current_user

  end

  def show
    @posts = current_user.posts.paginate(page: params[:page], per_page: 10)
    @post = Post.new
  end

  def destroy
    @user = User.find_by_id(params[:id]).destroy
    @users = User.all.paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def correct_user
      @user = User.find_by_id(params[:id])
      unless !@user.nil? and @user.id == current_user.id
        redirect_to current_user, notice: '无法访问其他用户账户信息'
      end
    end

    def is_admin
      unless current_user.admin
        redirect_to current_user, notice: '你不是管理员'
      end
    end

end
