class RegistrationsController <ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice:"sucessfully created"
        else
            redirect_to sign_up_path, alert:"enter a valid email adress"

        end
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)

    end


end