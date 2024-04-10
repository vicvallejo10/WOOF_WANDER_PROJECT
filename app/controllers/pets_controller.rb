class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user

    if @pet.save
      render json: { message: 'Pet added successfully' }, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @pets = current_user.pets # Assuming pets are associated with the current user
    respond_to do |format|
      format.html { render partial: 'pets_list', locals: { pets: @pets } } # Respond with HTML (using a partial)
      format.json { render json: @pets } # Respond with JSON (optional, if needed)
    end
  end
  private

  def pet_params
    params.require(:pet).permit(:pet_name, :birthdate, :microchip_number, :breed, :size, :color, :sterilized) #:vaccine_card, :pet_photo)
  end
end
