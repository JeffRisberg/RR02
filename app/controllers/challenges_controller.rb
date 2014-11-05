class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  # GET /challenges
  # GET /challenges.json
  def index
    cfp = params[:challenge_filter] ?
        params.require(:challenge_filter).permit(:name, :challenge_type) : Hash.new

    @challenges = Challenge.all
    @challenges = @challenges.where('name like ?', "%" + cfp[:name] + "%") if cfp[:name] && !cfp[:name].empty?
    @challenges = @challenges.where('challenge_type = ?', cfp[:challenge_type]) if cfp[:challenge_type] && !cfp[:challenge_type].empty?

    @challenge_filter = ChallengeFilter.new(cfp)
  end

# GET /challenges/1
# GET /challenges/1.json
  def show
  end

# GET /challenges/new
  def new
    @challenge = Challenge.new
  end

# GET /challenges/1/edit
  def edit
  end

# POST /challenges
# POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)
    puts challenge_params
    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @challenge }
      else
        format.html { render action: 'new' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

# PATCH/PUT /challenges/1
# PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update_attributes(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

# GET /challenges/open
  def open
    @challenges = Challenge.where { (starts_at <= Time.now) & (ends_at >= Time.now) }
  end

# DELETE /challenges/1
# DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def challenge_params
    params.require(:challenge).permit(:name, :description, :challenge_type, :starts_at, :ends_at)
  end

end
