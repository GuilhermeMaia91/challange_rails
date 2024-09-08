class CountryDetailsController < ApplicationController
  before_action :authenticate_user!

  def index
    lister = CountryDetailManager::Lister.new(params[:page], params[:per_page], filters).build
    render json: lister, serializer: CountryDetailSerializer::ListResource
  end

  def show
    shower = CountryDetailManager::Shower.new(params[:id]).build
    render json: shower, serializer: CountryDetailSerializer::Model
  end

  def create
    manager = CountryDetailManager::Creator.new(country_detail_params[:country_id], country_detail_params[:observation], country_detail_params[:picture])
    render json: manager.create, serializer: CountryDetailSerializer::Model
  end

  def update
    updater = CountryDetailManager::Updater.new(params[:id], country_detail_params).update
    render json: updater, serializer: CountryDetailSerializer::Model
  end

  def destroy
    destroyer = CountryDetailManager::Destroyer.new(params[:id]).delete
    render json: destroyer, serializer: CountryDetailSerializer::Model
  end

  private

  def country_detail_params
    params.permit(:country_id, :observation, :picture)
  end

  def filters
    { name: params[:name], observation: params[:observation] }
  end
end
