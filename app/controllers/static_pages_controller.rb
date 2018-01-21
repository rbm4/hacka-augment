class StaticPagesController < ApplicationController
    def index
        user = current_user
        case params[:tipo]
        when nil,"demand"
            @demand = Demand.where('tipo = :tpp',{tpp: "demand"}).order(created_at: :desc)
        when "ofertas"
            @demand = Offer.all.order(created_at: :desc)
        when "userOffer"
            @demand = current_user.offer.all.order(created_at: :desc)
        when "user"
            @demand = current_user.demand.where("tipo = :tpp", {tpp:"demand"}).order(created_at: :desc)
        when "submits"
            @demand = current_user.entrega.where("status = :stt",{stt: "analise"})
        when "histories"
            @demand = current_user.entrega.where("status != :stt",{stt: "analise"})
        when "demand_histories"
            @demand = current_user.demand.all
        when "rate_submits"
            @demand = []
            current_user.demand.where("tipo = :tpp",{tpp: "demand"}).each do |k|
              k.entrega.where("status = :stt",{stt: "analise"}).each do |submit|
                  @demand << submit
              end
            end
            @demand
        else
            @demand = Demand.where("tipo = :tpp",{tpp: params[:tipo]}).order(created_at: :desc)
        end
    end
    def demand
        @demand = Demand.find(params[:id])
    end
    def demand_update
        @entregas = Entrega.find(params[:id])
        @demand = Demand.find(@entregas.demand_id)
    end
    def demand_finalize
        @demand = Demand.find(params[:id])
        @demand.tipo = "demand_complete"
        @demand.save
        redirect_to "/demand/details/#{@demand.id}"
    end
    def partials
        @object = Demand.find(params[:id])
        if params[:partial] == "submit"
            @entrega = current_user.entrega.new
        elsif params[:partial] == "ranking"
            @objects = Entrega.where("status = :stt AND demand_id = :dmm",{stt: "Aceita", dmm: @object.id.to_s}).order(score: :asc)
        end
    end
    def offer
        @demand = Offer.find(params[:id])
    end
   
end
