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
    pet_name = @pet.pet_name

    if @pet.destroy
      redirect_to accountinformation_path, notice: "Pet '#{pet_name}' was successfully deleted."
    else
      redirect_to accountinformation_path, alert: "Delete attempt unsuccessful"
    end
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
  end

  def age
    now = Time.now.utc.to_date
    birthdate = self.birthdate
    age_in_years = now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
    age_in_years
  end

  private

  def pet_params
    params.require(:pet).permit(:pet_name, :birthdate, :microchip_number, :breed, :size, :color, :sterilized) #:vaccine_card, :pet_photo)
  end
  def set_pet
    @pet = Pet.find(params[:id])
  end
end
