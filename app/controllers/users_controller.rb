class UsersController<ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Registration successful, congrats you can use a keyboard.'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your profile has been updated."
      redirect_to edit_user_page(@user)
    else
      flash[:error] = "An error has occured."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation, :created_at)
  end

end
