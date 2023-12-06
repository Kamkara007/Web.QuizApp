class LevelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_level, only: %i[ show edit update destroy ]

  # GET /levels or /levels.json
  def index
    @levels = Level.all.ordered
  end

  # GET /levels/1 or /levels/1.json
  def show
  end

  # GET /levels/new
  def new
    @level = Level.new
  end

  # GET /levels/1/edit
  def edit
  end

  # POST /levels or /levels.json
  def create
    @level = current_user.levels.build(level_params)

    respond_to do |format|
      if @level.save
        format.html { redirect_to level_url(@level), notice: "Level was successfully created." }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /levels/1 or /levels/1.json
  def update
    respond_to do |format|
      if @level.update(level_params)
        format.html { redirect_to level_url(@level), notice: "Level was successfully updated." }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1 or /levels/1.json
  def destroy
    @level.destroy

    respond_to do |format|
      format.html { redirect_to levels_url, notice: "Level was successfully destroyed." }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @level = Level.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def level_params
      params.require(:level).permit(:title, :slug, :user_id)
    end
end
