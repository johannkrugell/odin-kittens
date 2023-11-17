# frozen_string_literal: true

# Controller for Kittens
class KittensController < ApplicationController
  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = 'Kitten created!'
      redirect_to @kitten # Redirect to the show page for the newly created kitten
    else
      render 'new'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    redirect_to kittens_path
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:success] = 'Kitten created!'
      redirect_to kittens_path # Redirect to the index page
    else
      render 'edit'
    end
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
