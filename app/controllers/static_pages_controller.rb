class StaticPagesController < ApplicationController
    def index
        user = current_user
        case params[:tipo]
        when nil,"demand"
            @demand = Demand.all.order(created_at: :desc)
        when "ofertas"
            @demand = Offer.all.order(created_at: :desc)
        when "userOffer"
            @demand = current_user.offer.all.order(created_at: :desc)
        when "user"
            @demand = current_user.demand.all.order(created_at: :desc)
        when "submits"
            @demand = current_user.entrega.where("status = :stt",{stt: "analise"})
        when "historys"
            @demand = current_user.entrega.where("status != :stt",{stt: "analise"})
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
    def partials
        @object = Demand.find(params[:id])
        if params[:partial] == "submit"
            @entrega = current_user.entrega.new
        elsif params[:partial] == "ranking"
            @objects = Entrega.where("status = :stt AND demand_id = :dmm",{stt: "Aceita", dmm: @object.id}).order(score: :asc)
        end
    end
    def offer
        @demand = Offer.find(params[:id])
    end
   
end
