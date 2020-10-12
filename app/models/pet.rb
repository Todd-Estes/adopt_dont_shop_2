class Pet < ApplicationRecord
  # validates_presence_of :name
  belongs_to :shelter

  validates_presence_of :image_url, :name, :approximate_age, :sex 


end
