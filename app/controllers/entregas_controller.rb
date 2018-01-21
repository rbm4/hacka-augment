class EntregasController < ApplicationController
    def create
        @demand = Demand.find(entregas_params[:demand_id])
        @entrega = @demand.entrega.new(entregas_params)
        @entrega.user_id = current_user.id
        @entrega.status = "analise"
        if @entrega.save
          flash[:success] = "Projeto submetido!"
          redirect_to '/user/index'
        else
          render '/user/index'
        end
    end
    def update
        @entrega = Entrega.find(entregas_params[:id])
        @entrega.score = entregas_params[:score]
        @entrega.status = params[:status]
        if @entrega.save
           redirect_to '/demand/type/rate_submits'
        end
    end
   
   
    private
    
    def entregas_params
        params.require(:entrega).permit(:title, :description, :repository_link, :tipo, :demand_id, :score, :id, :status)
    end
end
