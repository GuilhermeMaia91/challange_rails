class CountriesController < ApplicationController
  before_action :authenticate_user!

  def index
    lister = CountryManager::Lister.new(params[:page], params[:per_page], filters).build
    render json: lister, serializer: CountrySerializer::ListResource
  end

  def show
    shower = CountryManager::Shower.new(params[:id]).build
    render json: shower, serializer: CountrySerializer::Model
  end

  def create
    manager = CountryManager::Creator.new(country_params[:name], country_params[:name_short])
    render json: manager.create, serializer: CountrySerializer::Model
  end

  def update
    updater = CountryManager::Updater.new(params[:id], country_params).update
    render json: updater, serializer: CountrySerializer::Model
  end

  def destroy
    destroyer = CountryManager::Destroyer.new(params[:id]).delete
    render json: destroyer, serializer: CountrySerializer::Model
  end

  private

  def country_params
    params.permit(:name, :name_short)
  end

  def filters
    { name: params[:name], name_short: params[:name_short] }
  end
end
