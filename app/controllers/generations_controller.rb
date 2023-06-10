# frozen_string_literal: true

class GenerationsController < ApplicationController
  before_action :set_generation, only: [:show, :update, :destroy]

  # GET /generations
  def index
    @generations = Generation.all

    render json: @generations
  end

  # GET /generations/1
  def show
    render json: @generation
  end

  # POST /generations
  def create
    @generation = Generation.new(generation_params)

    if @generation.save
      render json: @generation, status: :created
    else
      render json: @generation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /generations/1
  def update
    if @generation.update(generation_params)
      render json: @generation
    else
      render json: @generation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /generations/1
  def destroy
    @generation.destroy
  end

  private
  def set_generation
    @generation = Generation.find(params[:id])
  end

  def generation_params
    params.require(:generation).permit(:number)
  end
end
