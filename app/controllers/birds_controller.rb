class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds

    # select specific data to render from multiple hashes
    # render json: birds, only: [:id, :name, :species]

    # can exclude when that's shorter
    render json: birds, except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird

    # manually select datat to render
    # render json: {id: bird.id, name: bird.name, species: bird.species } 

    # error handling messages if id is nil aka falsy
    if bird 

    # use slice method to select data to render from a single hash
    render json: bird.slice(:id, :name, :species)
    else 
      # personalized error message 
      render json: { message: 'Bird not found' }
    end
  end

  def new 
    bird = Bird.new
    render json: bird 
  end
  
end