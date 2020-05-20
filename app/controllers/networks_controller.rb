class NetworksController < ApplicationController
  before_action :set_network, only: [:show, :edit, :update, :destroy]

  def index
    @networks = Network.all
  end

  def show
  end

  def new
    @network = Network.new
  end

  def create
    @network = Network.new(network_params)
    if @network.save
      redirect_to networks_path
    else
      render :new
    end
  end

  def update
    @network.update(network_params)
      redirect_to network_path(@network)
  end

  def edit
  end

  def destroy
    @network.destroy
    redirect_to networks_path
  end

   private

  def network_params
    params.require(:network).permit(:name, :vlan, :description, :subnet, :gateway, :assets)
  end

  def set_network
    @network = Network.find(params[:id])
  end
end