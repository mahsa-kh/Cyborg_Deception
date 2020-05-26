class DecoyTemplatesController < ApplicationController
  before_action :set_decoy_template, only: [:show, :edit, :update, :destroy]

  def index
    @decoy_templates = DecoyTemplate.all
  end

  def show
  end

  def new
    @decoy_template = DecoyTemplate.new
  end

  def create
    @decoy_template = DecoyTemplate.new(decoy_template_params)

    if @decoy_template.save
      redirect_to decoy_templates_path
    else
      render :new
    end
  end

  def update
    @decoy_template.update(decoy_template_params)
      redirect_to  decoy_templates_path(@decoy_template)
  end

  def edit
  end

  def destroy
    @decoy_template.destroy
    redirect_to decoy_templates_path
  end

   private

  def decoy_template_params
    params.require(:decoy_template).permit(:name, :template, :description, :service, :os)
  end

  def set_decoy_template
    # raise
    @decoy_template = DecoyTemplate.find(params[:id])
  end
end
