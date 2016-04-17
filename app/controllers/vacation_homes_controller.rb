class VacationHomesController < ApplicationController
  before_action :set_vacation_home, only: [:show, :edit, :update, :destroy]

  # GET /vacation_homes
  # GET /vacation_homes.json
  def index
    @vacation_homes = VacationHome.all
    if params[:search]
        @vacation_homes = VacationHome.search(params[:search])
    else
      @vacation_homes = VacationHome.all.order("property_address")
    end
  end

  # GET /vacation_homes/1
  # GET /vacation_homes/1.json
  def show
  end

  # GET /vacation_homes/new
  def new
    @vacation_home = VacationHome.new
  end

  # GET /vacation_homes/1/edit
  def edit
  end

  # POST /vacation_homes
  # POST /vacation_homes.json
  def create
    @vacation_home = VacationHome.new(vacation_home_params)

    respond_to do |format|
      if @vacation_home.save
        format.html { redirect_to @vacation_home, notice: 'Vacation home was successfully created.' }
        format.json { render :show, status: :created, location: @vacation_home }
      else
        format.html { render :new }
        format.json { render json: @vacation_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacation_homes/1
  # PATCH/PUT /vacation_homes/1.json
  def update
    respond_to do |format|
      if @vacation_home.update(vacation_home_params)
        format.html { redirect_to @vacation_home, notice: 'Vacation home was successfully updated.' }
        format.json { render :show, status: :ok, location: @vacation_home }
      else
        format.html { render :edit }
        format.json { render json: @vacation_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacation_homes/1
  # DELETE /vacation_homes/1.json
  def destroy
    @vacation_home.destroy
    respond_to do |format|
      format.html { redirect_to vacation_homes_url, notice: 'Vacation home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    VacationHome.import(params[:file])
    redirect_to vacation_homes_url, notice: "VHRs Database Updated"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacation_home
      @vacation_home = VacationHome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacation_home_params
      params.require(:vacation_home).permit(:business_id, :business_name, :contact_name, :contact_email, :contact_phone, :property_address, :max_occupancy, :parking_spaces, :refuse_day)
    end
end
