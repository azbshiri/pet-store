class PetsController < ApplicationController
  before_action :authenticate!, only: %i[create update delete]
  before_action -> { authorize!(%i[pet_owner manager]) }, only: %i[create update destroy]


  def index
    limit = params[:limit] || 10
    offset = params[:offset] || 0
    render json: Pet.includes(:user).limit(params[:limit]).offset(params[:offset])
  end

  def show
    render json: Pet.includes(:user).find(params[:id])
  end

  def create
    param! :name, String, required: true
    param! :pet_type, String, in: Pet.pet_types.keys, required: true

    pet = Pet.create!(
        user: current_user,
        name: params[:name],
        pet_type: params[:pet_type]
    )

    render json: pet, status: :created
  end

  def update
    param! :name, String, required: true
    param! :pet_type, String, in: Pet.pet_types.keys, required: true

    if current_user.manager?
      pet = Pet.find_by_hashid!(params[:id])
      pet.name = params[:name]
      pet.pet_type = params[:pet_type]
      pet.save!
      return
    end

    pet = current_user.pets.find_by_hashid!(params[:id])
    pet.name = params[:name]
    pet.pet_type = params[:pet_type]
    pet.save!
  end

  def destroy
    if current_user.manager?
      Pet.find_by_hashid!(params[:id]).destroy!
      return
    end

    current_user.pets.find_by_hashid!(params[:id]).destroy!
  end
end
