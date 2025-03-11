class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update]

  def index
    @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = current_user.dogs.build(dog_params)
    if @dog.save
      redirect_to @dog, notice: "Dog profile created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to @dog, notice: "Dog profile updated successfully!"
    else
      render :edit
    end
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :address, :latitude, :longitude, :size)
  end
end
