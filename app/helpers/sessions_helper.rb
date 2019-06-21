module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        if (user_id = session[:user_id])
            @current_user ||=  User.find_by(id: user_id)
        end
    end

    def route_by_logged_in
        unless logged_in?
            redirect_to login_url
        end
    end

    def logged_in?
        !current_user.nil?
    end
end
