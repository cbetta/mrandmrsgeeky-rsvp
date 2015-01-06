class GuestsController < ApplicationController

  def index
    redirect_to :root
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(permitted_params[:guest])
    if @guest.save
      message = @guest.confirmed? ? "Thank you for confirming / Bedankt voor de bevestiging" : "Thank you for confirming you can't make it / Bedankt voor het bevestigen dat je het niet kan maken"
      redirect_to :root, notice: message
    else
      render :new
    end
  end

  private

  def permitted_params
    params.permit(guest: [
      :status, :email, :name, :plus_one_name
    ])
  end
end
