class SessionsController < ApplicationController
    before_action :block_access, except: [:destroy]
    def new
    end

    def create
        @user = User.find_by(name: params[:session][:name])
        if @user && @user.authenticate(params[:session][:password])
            sign_in(@user)
            redirect_to @user
        else
            render 'new'
        end
    end


    def destroy
        log_out
        redirect_to root_path
    end
end
