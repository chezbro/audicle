class ProvidersController < ApplicationController
  def index
    @providers = Provider.all
  end
  def show
    @provider = Provider.find(params[:id])
    @provider_recordings = @provider.recordings
  end

  private
  def provider_params
    params.require(:provider).permit(:id)
  end
end
