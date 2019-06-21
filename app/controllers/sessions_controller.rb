class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(email: params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
            log_in @user
            redirect_to tasks_path
        else
            flash.now[:danger] = '不正なメールアドレスとパスワードの組み合わせです'
            render 'new'
        end
    end

    def destroy
    end

end
