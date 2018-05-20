class ScentsController < ApplicationController
  before_action :set_scent, only: [:show, :edit, :update, :destroy]

  # GET /scents
  # GET /scents.json
  def index
    @scents = Scent.all
  end

  # GET /scents/1
  # GET /scents/1.json
  def show
  end

  # GET /scents/new
  def new
    @scent = Scent.new
  end

  # GET /scents/1/edit
  def edit
  end

  # POST /scents
  # POST /scents.json
  def create
    @scent = Scent.new(scent_params)

    respond_to do |format|
      if @scent.save
        format.html { redirect_to @scent, notice: 'Scent was successfully created.' }
        format.json { render :show, status: :created, location: @scent }
      else
        format.html { render :new }
        format.json { render json: @scent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scents/1
  # PATCH/PUT /scents/1.json
  def update
    respond_to do |format|
      if @scent.update(scent_params)
        format.html { redirect_to @scent, notice: 'Scent was successfully updated.' }
        format.json { render :show, status: :ok, location: @scent }
      else
        format.html { render :edit }
        format.json { render json: @scent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scents/1
  # DELETE /scents/1.json
  def destroy
    @scent.destroy
    respond_to do |format|
      format.html { redirect_to scents_url, notice: 'Scent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scent
      @scent = Scent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scent_params
      params.require(:scent).permit(:name, :description, :brand_id)
    end
end
