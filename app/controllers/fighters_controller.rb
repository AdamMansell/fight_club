# frozen_string_literal: true

class FightersController < ApplicationController
  before_action :set_fighter, only: %i[show update destroy]

  # GET /fighters
  def index
    @fighters = Fighter.all

    render json: @fighters
  end

  # GET /fighters/1
  def show
    render json: @fighter
  end

  # POST /fighters
  # Fighter.create(name: '', age: 19. weight: 45, ...)

  # filgter = Fighter.new(name: '', age: 19. weight: 45, ...)
  # fighter.save

  def create
    @fighter = Fighter.new(fighter_params)

    if @fighter.save
      render json: @fighter, status: :created, location: @fighter
    else
      render json: @fighter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fighters/1
  def update
    if @fighter.update(fighter_params)
      render json: @fighter
    else
      render json: @fighter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fighters/1
  def destroy
    @fighter.destroy
    render json: { message: 'Successfully Deleted the Fighter!' }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fighter
    @fighter = Fighter.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def fighter_params
    # { fighter: { name: '', age: 19, weight: ....} }
    # {"fighter"=>{"name"=>"Rodtang", "age"=>"22", "weight"=>"130", "height"=>"68", "type_of_fighter"=>"Muay Thai"}}
    # byebug
    params.require(:fighter).permit(:name, :age, :weight, :height, :type_of_fighter)
    #  { name: '', age: 19, weight: ....}
  end
end
