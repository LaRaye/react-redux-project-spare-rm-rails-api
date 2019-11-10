class GuestsController < ApplicationController
  def index
    guests = Guest.all

    render json: guests
  end

  def show
     guest = Guest.find(params[:id])

    render json: guest
  end

  def create
    guest = Guest.new(guest_params)

    if guest.save
      render json: guest
    else
      render json: {status: guest.errors.full_messages }, status: 422
    end
  end

  def update
    guest = Guest.find(params[:id])

    if guest.update(guest_params)
      render json: guest
    else
      render json: {status: guest.errors.full_messages }, status: 422
    end
  end

  def destroy
    guest = Guest.find(params[:id])

    if guest.destroy
      render json: guest.full_name
    else
      render json: {status: 500, message: 'Guest cannot be destroyed'}
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :email, :phone)
  end
end
