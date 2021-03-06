class CategoriesController < ApplicationController
  before_action :authenticate!, only: %i[create update delete]
  before_action -> { authorize!(%i[pet_owner manager]) }, only: %i[create update destroy]

  def index
    limit = params[:limit] || 10
    offset = params[:offset] || 0
    render json: Category.includes(:user).limit(params[:limit]).offset(params[:offset])
  end

  def show
    render json: Category.includes(:user).find(params[:id])
  end

  def create
    param! :name, String, required: true

    category = Category.create!(
        user: current_user,
        name: params[:name],
    )

    render json: category, status: :created
  end

  def update
    param! :pet_ids, Array, required: true

    if current_user.manager?
      category = Category.find(params[:id])
      category.pets = Pet.find(params[:pet_ids])
      category.save!
      return
    end

    category = current_user.categories.find(params[:id])
    category.pets = current_user.pets.find(params[:pet_ids])
    category.save!
  end

  def destroy
    if current_user.manager?
      Category.find(params[:id]).destroy!
      return
    end

    current_user.categories.find(params[:id]).destroy!
  end
end
