# encoding: utf-8
class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights

  def index
    @flights = Flight.all
  end

  def view
    @flights = Flight.all
  end

  def show
  end

  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  # POST /flights/1/edit
  def edit
    if params.has_key?(:for_delete)
      @flight.staffs.delete(Staff.find_by id: params[:for_delete])
    end
    if params.has_key?(:add_staff)
      @flight.staffs<<(Staff.find_by name: params[:add_staff])
    end
    staff = @flight.staffs

    @pilots = staff.where(profession: 'pilot')
    @navigators = staff.where(profession: 'navigator')
    @operators = staff.where(profession: 'operator')
    @stewardess = staff.where(profession: 'stewardess')

    @rest_pilots = []
    @rest_navigators = []
    @rest_operators = []
    @rest_stewardess = []
    Staff.find_each do |staff|
      if !staff.flights.exists?(@flight)
        if staff.profession == "pilot"
          @rest_pilots.push(staff.name)
        elsif staff.profession == "navigator"
          @rest_navigators.push(staff.name)
        elsif staff.profession == "operator"
          @rest_operators.push(staff.name)
        else
          @rest_stewardess.push(staff.name)
        end
      end
    end
  end

  def newStaff

  end

  def staff
  end

  # POST /flights
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_flight
      @flight = Flight.find(params[:id])
    end

    def flight_params
      params.require(:flight).permit(:num, :fromFlight, :toFlight, :status)
    end
end
