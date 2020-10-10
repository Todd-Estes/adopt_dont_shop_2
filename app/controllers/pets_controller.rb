class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    pet = shelter.pets.create({
                                name:         params[:name],
                                approx_age:   params[:approx_age],
                                sex:          params[:sex],
                                image_path:   params[:image_path],
                                description:  params[:description]
                              })
    pet.save
    redirect_to "/pets"
  end
end
