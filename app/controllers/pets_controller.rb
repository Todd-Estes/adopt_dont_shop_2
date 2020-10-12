class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    pet = shelter.pets.create({
                                name:         params[:pet][:name],
                                approximate_age:   params[:pet][:approximate_age],
                                sex:          params[:pet][:sex],
                                image_url:   params[:pet][:image_url],
                                description:  params[:pet][:description]
                              })
    pet.save
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def update
  pet = Pet.find(params[:id])
  pet.update({
    name: params[:pet][:name],
    approximate_age: params[:pet][:approximate_age],
    sex: params[:pet][:sex],
    image_url: params[:pet][:image_url],
    description: params[:pet][:description]
    })
  pet.save
  redirect_to "/pets/#{pet.id}"
end

def destroy
  Pet.destroy(params[:id])
  redirect_to '/pets'
end
end
