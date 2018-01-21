class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
  def demands_number
    current_user.demand.where("tipo = :tpp",{tpp: "demand"}).size
  end
  def demands_submits_number
    total = 0
    current_user.demand.where("tipo = :tpp",{tpp: "demand"}).each do |k|
      total += k.entrega.where("status = :stt",{stt: "analise"}).size
    end
    total
  end
  def offers_number
    current_user.offer.where("status = :tpp",{tpp: "open"}).size
  end
  def user_submits_number
    current_user.entrega.all.size
  end
  def history_submit_number
    current_user.entrega.where("status != :stt", {stt:"analise"}).size
  end
  def history_demand_number
    current_user.demand.all.size
  end
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  def stat_label(string)
    case string.downcase
    when "analise"
      "Em análise"
    else
      string
    end
  end
  helper_method :current_user_session, :current_user, :demands_number, :demands_submits_number, :offers_number, :user_submits_number, :stat_label, :history_submit_number, :history_demand_number
  
end
