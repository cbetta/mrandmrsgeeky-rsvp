class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(permitted_params[:guest])
    if @guest.save
      message = @guest.confirmed? ? "Thank you for confirming" : "Thank you for cancelling"
      redirect_to :root, notice: message
    else
      render :new
    end
  end

  private

  def permitted_params
    params.permit(guest: [
      :state, :email
    ])
  end
end
