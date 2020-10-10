class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def create
    pet = Pet.new({
      image_url: params[:pet][:image_url],
      name: params[:pet][:name],
      approximate_age: params[:pet][:approximate_age],
      sex: params[:pet][:sex],
      shelter_name: params[:pet][:shelter_name]
      })
    pet.save
    redirect_to '/pets'
  end

end
