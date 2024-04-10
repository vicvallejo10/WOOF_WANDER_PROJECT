class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
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

  def show
    @pet = Pet.find(params[:id])
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_url, notice: "Pet #{params[:id]} was successfully deleted."
  end

  def update
    # Your update action logic here
    if @pet.update(pet_params)
      redirect_to @pet, notice: 'Pet was successfully updated.'
    else
      render :edit
    end
  end


  def edit
    # Your edit action logic here
  end

  private

  def pet_params
    params.require(:pet).permit(:pet_name, :birthdate, :microchip_number, :breed, :size, :color, :sterilized) #:vaccine_card, :pet_photo)
  end
  def set_pet
    @pet = Pet.find(params[:id])
  end
end
