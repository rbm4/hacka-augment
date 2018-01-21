class Entrega < ActiveRecord::Base
    belongs_to :user
    has_one :demand
end
