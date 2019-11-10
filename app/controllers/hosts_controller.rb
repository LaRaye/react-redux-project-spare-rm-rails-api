class HostsController < ApplicationController

  def index
    hosts = Host.all

    render json: hosts
  end

  def show
    host = Host.find(params[:id])

    render json: host
  end

  def create
    host = Host.new(host_params)

    if host.save
      render json: host
    else
      render json: {status: host.errors.full_messages }, status: 422
    end
  end

  def update
    host = Host.find(params[:id])

    if host.update(host_params)
      render json: host
    else
      render json: {status: host.errors.full_messages }, status: 422
    end
  end

  def destroy
    host = Host.find(params[:id])

    if host.destroy
      render json: host.full_name
    else
      render json: {status: 500, message: 'Host cannot be destroyed'}
    end
  end

  private

  def host_params
    params.require(:host).permit(:first_name, :last_name, :email, :phone)
  end
end
