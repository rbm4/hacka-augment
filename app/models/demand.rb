class Demand < ActiveRecord::Base
    belongs_to :user
    has_many :entrega
end
