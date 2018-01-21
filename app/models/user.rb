class User < ActiveRecord::Base
    has_many :demand
    has_many :offer
    has_many :entrega
    #@deman = current_user.demand.new
    acts_as_authentic do |c|
        c.crypto_provider = Authlogic::CryptoProviders::Sha512
    end
end
