class DecoysController < ApplicationController
  before_action :set_decoy, only: [:show, :edit, :update, :destroy]

  def index
    @decoys = Decoy.all
  end

  def show
  end

  def new
    @decoy = Decoy.new
  end

  def create
    @decoy = Decoy.new(decoy_params)

    if @decoy.save
      cmd= "docker create -it --cap-add NET_ADMIN --network {} -e GW={} --name {} -v /home/cyborg/Projects/deception-backend/{}:/usr/local/etc/haproxy/haproxy.cfg:ro cyborgsec/haproxy".format(data['network'],network ,data['name'],cfg)

      system(cmd)
      system("docker network connect deception {}".format(data['name']))
      system("docker start {}".format(data['name']))
      redirect_to decoys_path
    else
      render :new
    end
  end

  def update
    @decoy.update(decoy_params)
      redirect_to decoys_path(@decoy)
  end

  def edit
  end

  def destroy
    @decoy.destroy
    redirect_to decoys_path
  end

   private

  def decoy_params
    params.require(:decoy).permit(:name, :ip, :description, :config, :network_id, :decoy_template_id)
  end

  def set_decoy
    @decoy = Decoy.find(params[:id])
  end
end
