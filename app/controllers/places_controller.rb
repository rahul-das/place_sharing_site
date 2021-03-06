class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = current_user.created_places
    @places += Place.shared_public.not_cteated_by(current_user)
    @places += Place.shared_with(current_user)
    if @places.blank?
      redirect_to new_place_url, notice: "You don't have any shared places yet. Would you like to create one?"
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
    unless current_user == @place.user
      redirect_to @place, notice: 'You are not the creator of this place!'
    end
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        p @place.errors
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if current_user == @place.user
        if @place.update(place_params)
          format.html { redirect_to @place, notice: 'Place was successfully updated.' }
          format.json { render :show, status: :ok, location: @place }
        else
          format.html { render :edit }
          format.json { render json: @place.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    unless current_user == @place.user
      redirect_to places_url, notice: 'You are not the creator of this place!'
    end
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:name, :latitude, :longitude, :is_public, shared_user_ids: []).merge(user_id: current_user.id)
    end
end
