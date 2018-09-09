class Participante < ApplicationRecord
  belongs_to :user
  belongs_to :sala
  
  accepts_nested_attributes_for :user, :sala

end
