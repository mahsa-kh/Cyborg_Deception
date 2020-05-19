class Api::V1::NetworksController < Api::V1::BaseController
  def index
    @networks = Network.all
    # render json: @networks
  end
end
