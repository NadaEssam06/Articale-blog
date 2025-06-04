class ArticalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_articale, only: [:show, :edit, :update, :destroy , :report, :unarchive]

  def index
    @articales = Articale.where(archived: [false, nil])
    authorize @articales
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
  
  def report
    # @articale = Articale.find(params[:id])
    @articale.increment!(:report_number)
    if @articale.report_number == 3
      @articale.update(archived: true)
      redirect_to articales_path , notice: "This article has been archived after multiple reports."

    elsif @articale.report_number >= 6
      @articale.destroy #dont call path for destroy just destroy it
      redirect_to articales_path, alert: "The article has been removed due to repeated reports."
      else 
      redirect_to articales_path, notice: "Thank you for reporting this article."
    end
  end
  
  def archived
    @articales = current_user.articales.where(archived: true)
  end

  def unarchive
    authorize @articale
    @articale.update(archived: false)
    redirect_to archived_articales_path, notice: "Article has been unarchived."
  end
  private

  def set_articale
    @articale = Articale.find(params[:id])
  end

  def articale_params
    params.require(:articale).permit(:title, :body, :published, :image,:report_number).merge(user_id: current_user.id)
  end #just parameter in premit are known in views
end
