class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def index
        if current_user.tipo.downcase == "parceiro"
            @demand = current_user.demand.new
        elsif current_user.tipo.downcase == "colaborador"
            @offer = current_user.offer.new
        end
    end
    def create
        @user = User.new(users_params)
        p @user.tipo = params[:tipo].downcase
        if @user.save
          flash[:success] = "Account registered!"
          redirect_to '/user/index'
        else
          render :new
        end
    end
    
    private
    
    def users_params
        params.require(:user).permit(:email, :password, :password_confirmation, :tipo)
    end
end
