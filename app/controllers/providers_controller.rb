class ProvidersController < ApplicationController
  def index
    @providers = Provider.all
  end
  def new
    @provider = Provider.new
  end
  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      redirect_to :authenticated_root
    else
      render :action => :new
    end
  end
  def show
    @provider = Provider.find(params[:id])
    @provider_recordings = @provider.recordings
  end

  private
  def provider_params
    params.require(:provider).permit(:id, :name, :description, :url, :image_url)
  end
end
