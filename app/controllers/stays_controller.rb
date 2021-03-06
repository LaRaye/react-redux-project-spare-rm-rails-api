class StaysController < ApplicationController
  def index
    if params[:host_id]
      stays = Host.find(params[:host_id]).stays
    elsif params[:guest_id]
      stays = Guest.find(params[:guest_id]).stays
    else
      stays = Stay.all
    end

    render json: stays
  end

  def show
     stay = Stay.find(params[:id])

    render json: stay
  end

  def create
    stay = Stay.new(stay_params)

    if stay.save
      render json: stay
    else
      render json: {status: stay.errors.full_messages }, status: 422
    end
  end

  def update
    stay = Stay.find(params[:id])

    if stay.update(stay_params)
      render json: stay
    else
      render json: {status: stay.errors.full_messages }, status: 422
    end
  end

  def destroy
    stay = Stay.find(params[:id])

    if stay.destroy
      render json: stay.id
    else
      render json: {status: 500, message: 'Stay cannot be destroyed'}
    end
  end

  private

  def stay_params
    params.require(:stay).permit(:host_first_name, :host_last_name, :host_email, :host_phone, :cost, :title, :location, :stay_type, :number_of_guests, :bedrooms, :baths, :amenities, :about, :host_id, :guest_id)
  end
end
