class Adm < ApplicationRecord
  belongs_to :user
  has_many :salas
  has_many :messages

  accepts_nested_attributes_for :messages, :salas, :user
end
