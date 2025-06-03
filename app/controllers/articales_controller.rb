class ArticalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_articale, only: [:show, :edit, :update, :destroy]

  def index
    @articales = Articale.all
  end

  def show
  end

  def new
    @articale = Articale.new
    authorize @articale
  end

  def edit
    authorize @articale
  end

  def create
    @articale = Articale.new(articale_params)
    @articale.user = current_user
    authorize @articale

    if @articale.save
      redirect_to @articale, notice: 'Articale was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @articale

    if @articale.update(articale_params)
      redirect_to @articale, notice: 'Articale was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @articale
    @articale.destroy
    redirect_to articales_path, notice: 'Articale was successfully deleted.'
  end

  private

  def set_articale
    @articale = Articale.find(params[:id])
  end

  def articale_params
    params.require(:articale).permit(:title, :body, :published, :image).merge(user_id: current_user.id)
  end
end
