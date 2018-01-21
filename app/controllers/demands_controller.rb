class DemandsController < ApplicationController
    def create
        @demand = current_user.demand.new(demand_params)
        @demand.tipo = "demand"
        if @demand.save
          flash[:success] = "Demanda iniciada!"
          redirect_to '/user/index'
        else
          render '/user/index'
        end
    end
    def demand_details
        @demand = Demand.find(params[:id])
        render "#{params[:detail]}"
    end
    
    
    private
    
    def demand_params
        params.require(:demand).permit(:name, :description, :rules, :value, :image_path, :short_description)
    end
end
