class ActivityTracksController < ApplicationController
  before_action :set_activity_track, only: [:show, :edit, :update, :destroy]

  # GET /activity_tracks
  # GET /activity_tracks.json
  def index
    @activity_tracks = ActivityTrack.all
  end

  # GET /activity_tracks/1
  # GET /activity_tracks/1.json
  def show
  end

  # GET /activity_tracks/new
  def new
    @activities = Activity.all
    @activity_track = ActivityTrack.new
  end

  # GET /activity_tracks/1/edit
  def edit
    @activities = Activity.all
  end

  # POST /activity_tracks
  # POST /activity_tracks.json
  def create
    @activity_track = ActivityTrack.new(activity_track_params)

    if @activity_track.valid?
      respond_to do |format|
        if @activity_track.save
          format.html { redirect_to @activity_track, notice: 'Activity track was successfully created.' }
          format.json { render action: 'show', status: :created, location: @activity_track }
        else
          format.html { render action: 'new' }
          format.json { render json: @activity_track.errors, status: :unprocessable_entity }
        end
      end
    else
      @activities = Activity.all
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @activity_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_tracks/1
  # PATCH/PUT /activity_tracks/1.json
  def update
    respond_to do |format|
      if @activity_track.update(activity_track_params)
        format.html { redirect_to @activity_track, notice: 'Activity track was successfully updated.' }
        format.json { head :no_content }
      else
        @activities = Activity.all
        format.html { render action: 'edit' }
        format.json { render json: @activity_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_tracks/1
  # DELETE /activity_tracks/1.json
  def destroy
    @activity_track.destroy
    respond_to do |format|
      format.html { redirect_to activity_tracks_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_activity_track
    @activity_track = ActivityTrack.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def activity_track_params
    params.require(:activity_track).permit(:activity_id, :amount, :tracked_on)
  end
end
