class ChallengeActivitiesController < ApplicationController
  before_action :set_challenge_activity, only: [:show, :edit, :update, :destroy]

  # GET /challenge_activities
  # GET /challenge_activities.json
  def index
    @challenge = Challenge.find(params[:id])
    @challenge_activities = ChallengeActivity.where(challenge: @challenge)
  end

  # GET /challenge_activities/1
  # GET /challenge_activities/1.json
  def show
    @challenge = @challenge_activity.challenge
  end

  # GET /challenge_activities/new
  def new
    @challenge = Challenge.find(params[:id])
    @challenge_activity = ChallengeActivity.new
    @challenge_activity.challenge = @challenge

    @activities = Activity.all
  end

  # GET /challenge_activities/1/edit
  def edit
    @challenge = @challenge_activity.challenge

    @activities = Activity.all
  end

  # POST /challenge_activities
  # POST /challenge_activities.json
  def create
    @challenge = Challenge.find(challenge_activity_params[:challenge_id])
    @challenge_activity = ChallengeActivity.new(challenge_activity_params)

    @activities = Activity.all

    respond_to do |format|
      if @challenge_activity.save
        format.html { redirect_to list_challenge_activities_url(@challenge), notice: 'Challenge activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @challenge_activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @challenge_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenge_activities/1
  # PATCH/PUT /challenge_activities/1.json
  def update
    @challenge = @challenge_activity.challenge

    respond_to do |format|
      if @challenge_activity.update_attributes(challenge_activity_params)
        format.html { redirect_to list_challenge_activities_url(@challenge), notice: 'Challenge activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @challenge_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenge_activities/1
  # DELETE /challenge_activities/1.json
  def destroy
    @challenge = @challenge_activity.challenge
    @challenge_activity.destroy

    respond_to do |format|
      format.html { redirect_to list_challenge_activities_url(@challenge) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_challenge_activity
    @challenge_activity = ChallengeActivity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def challenge_activity_params
    params.require(:challenge_activity).permit(
        :challenge_id, :activity_id, :seq_num,
        :threshold_value, :threshold_kind, :number_thresholds, :points_per_threshold
    )
  end
end
