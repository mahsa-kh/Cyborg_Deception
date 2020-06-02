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
    @network.update(user_id: current_user.id)

    if @network.save
      system("vconfig add #{ENV["INTERFACE"]} #{@network.vlan}")
      system("ifconfig #{ENV["INTERFACE"]}.#{@network.vlan} up")
      # interface: environment variable va inja bayad call beshe
      # vlan_id az network e tarif shode miad
      macvlan_net = "macvlan-#{@network.vlan}"

      @network.update(macvlan_name: macvlan_net)

      system("docker network create -d macvlan --subnet=#{@network.subnet} --gateway=#{@network.gateway} -o parent=#{ENV["INTERFACE"]}.#{@network.vlan} #{macvlan_net}")

      # parent: inetrface env varian.vlan e netwoerk
      # akhari: macvlan_net: macvlan-vlanid
      redirect_to networks_path
    else
      render :new
    end
  end

  def update
    if @network.update(network_params)
      system("vconfig add #{ENV["INTERFACE"]} #{@network.vlan}")
      macvlan_net = "macvlan-#{@network.vlan}"
      system("docker network create -d macvlan --subnet=#{@network.subnet} --gateway=#{@network.gateway} -o parent=#{ENV["INTERFACE"]}.#{@network.vlan} #{macvlan_net}")
      redirect_to network_path(@network)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    if (!@network.decoys[0].nil?)
      flash[:alert] = "Delete decoys in your network first"
    else
      system("docker network rm #{@network.macvlan_name}")
      system("vconfig rem #{ENV["INTERFACE"]}.#{@network.vlan}")
      @network.destroy
      redirect_to networks_path
    end
  end

   private

  def network_params
    params.require(:network).permit(:name, :vlan, :description, :subnet, :gateway, :asset)
  end

  def set_network
    @network = Network.find(params[:id])
  end
end
