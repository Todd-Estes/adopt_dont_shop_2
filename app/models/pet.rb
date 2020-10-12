class Pet < ApplicationRecord
  # validates_presence_of :name
  belongs_to :shelter

  validates_presence_of :name


end
