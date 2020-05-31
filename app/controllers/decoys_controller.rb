require 'redis'
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




      file_name = "HAProxy-#{Time.now.to_i}-#{@decoy.name}"
      system("cd controllers/template")
      system("touch '#{file_name}.txt'")
      # system("touch 'controllers/template/#{file_name}.txt'")
      system("echo '#{@decoy.decoy_template.template}' >> '#{file_name}.txt'")

       # az decoy template , field temokatre ro mirizam toosah

      cmd= "docker create -it --cap-add NET_ADMIN --network #{@decoy.network.macvlan_name} -e GW=#{@decoy.network.gateway} --ip #{@decoy.ip} --name #{@decoy.name} -v #{File.expand_path("#{file_name}")}:/usr/local/etc/haproxy/haproxy.cfg:ro cyborgsec/haproxy"
      #  --nameL mishe name e decoy ee kle user vaered karde
      # -v: badesh address e : ./template/{esme file a config ke bala dorst kardim}  :/usr baghiaro negah midari

      system(cmd)
      system("docker network connect deception #{@decoy.name}")
      system("docker start #{@decoy.name}")

      redis = Redis.new(host: "localhost")
      redis.set(@decoy.ip, @decoy.name)

      redirect_to decoys_path
    else
      render :new
    end
  end

  def update

    if @decoy.update(decoy_params)
      system("docker stop #{@decoy.name}")
      system("docker rm #{@decoy.name}")
      file_name = "HAProxy-#{Time.now.getutc}-#{@decoy.name}"
      system("cd template")
      system("touch #{file_name}.txt")
      system("echo '#{@decoy.decoy_template.template}' >> #{file_name}.txt")

      cmd= "docker create -it --cap-add NET_ADMIN --network #{@decoy.network.name} -e GW=#{@decoy.network.gateway} --ip #{@decoy.ip} --name #{@decoy.name} -v ./template/#{file_name}:/usr/local/etc/haproxy/haproxy.cfg:ro cyborgsec/haproxy"

      system(cmd)
      system("docker network connect deception #{@decoy.name}")
      system("docker start #{@decoy.name}")



      redis = Redis.new(host: "localhost")
      redis.set(@decoy.ip, @decoy.name)

      redirect_to decoys_path(@decoy)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    system("docker stop #{@decoy.name}")
    system("docker rm #{@decoy.name}")
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
