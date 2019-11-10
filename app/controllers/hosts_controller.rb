class HostsController < ApplicationController
  before_action :find_host, only: [:show, :update, :destroy]

  def index
    hosts = Host.all

    render json: hosts
  end

  def show
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
    if host.update(host_params)
      render json: host
    else
      render json: {status: host.errors.full_messages }, status: 422
    end
  end

  def destroy
    if host.destroy
      render json: host.full_name
    else
      render json: {status: 500, message: 'Host cannot be destroyed'}
    end
  end

  private

  def find_host
    host = Host.find(params[:id])
  end

  def host_params
    params.require(:host).permit(:first_name, :last_name, :email, :phone)
  end
end
