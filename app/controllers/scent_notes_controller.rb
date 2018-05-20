class ScentNotesController < ApplicationController
  before_action :set_scent_note, only: [:show, :edit, :update, :destroy]

  # GET /scent_notes
  # GET /scent_notes.json
  def index
    @scent_notes = ScentNote.all
  end

  # GET /scent_notes/1
  # GET /scent_notes/1.json
  def show
  end

  # GET /scent_notes/new
  def new
    @scent_note = ScentNote.new
  end

  # GET /scent_notes/1/edit
  def edit
  end

  # POST /scent_notes
  # POST /scent_notes.json
  def create
    @scent_note = ScentNote.new(scent_note_params)

    respond_to do |format|
      if @scent_note.save
        format.html { redirect_to @scent_note, notice: 'Scent note was successfully created.' }
        format.json { render :show, status: :created, location: @scent_note }
      else
        format.html { render :new }
        format.json { render json: @scent_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scent_notes/1
  # PATCH/PUT /scent_notes/1.json
  def update
    respond_to do |format|
      if @scent_note.update(scent_note_params)
        format.html { redirect_to @scent_note, notice: 'Scent note was successfully updated.' }
        format.json { render :show, status: :ok, location: @scent_note }
      else
        format.html { render :edit }
        format.json { render json: @scent_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scent_notes/1
  # DELETE /scent_notes/1.json
  def destroy
    @scent_note.destroy
    respond_to do |format|
      format.html { redirect_to scent_notes_url, notice: 'Scent note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scent_note
      @scent_note = ScentNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scent_note_params
      params.require(:scent_note).permit(:scent_id, :note_id)
    end
end
