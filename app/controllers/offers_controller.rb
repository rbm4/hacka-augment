class OffersController < ApplicationController
    def create
        @offer = current_user.offer.new(offer_params)
        @offer.status = "open"
        if @offer.save
          flash[:success] = "Oferta iniciada!"
          redirect_to '/user/index'
        else
          render '/user/index'
        end
    end
    
    
    private
    def offer_params
        params.require(:offer).permit(:name, :description, :video_url, :short_description)
    end
end
