class ApartmentsController < ApplicationController
  before_action :set_apartment, only: %i[ show edit update destroy ]

  def index
    @apartments = Apartment.all
  end

  def show
    @stations = @apartment.stations
  end

  def new
    @apartment = Apartment.new
    2.times { @apartment.stations.build }
  end

  def edit
    @apartment.stations.build
  end

  def create
    @apartment = Apartment.new(apartment_params)

    respond_to do |format|
      if @apartment.save
        session[:apartment] = @apartment
        format.html { redirect_to @apartment, notice: "物件を登録しました！" }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: "物件を編集しました！" }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: "Apartment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    def apartment_params
      params.require(:apartment).permit(
        :name,
        :rent,
        :address,
        :age,
        :content,

        stations_attributes: [
          :route_name,
          :station_name,
          :walking_minutes,
          ],
        )
    end
end
