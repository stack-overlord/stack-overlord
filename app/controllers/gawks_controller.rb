class GawksController < ApplicationController
  before_action :set_gawk, only: [:show, :edit, :update, :destroy]

  # GET /gawks
  # GET /gawks.json
  def index
    @gawks = Gawk.all
  end

  # GET /gawks/1
  # GET /gawks/1.json
  def show
  end

  # GET /gawks/new
  def new
    @gawk = Gawk.new
  end

  # GET /gawks/1/edit
  def edit
  end

  # POST /gawks
  # POST /gawks.json
  def create
    @gawk = Gawk.new(gawk_params)

    respond_to do |format|
      if @gawk.save
        format.html { redirect_to @gawk, notice: 'Gawk was successfully created.' }
        format.json { render :show, status: :created, location: @gawk }
      else
        format.html { render :new }
        format.json { render json: @gawk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gawks/1
  # PATCH/PUT /gawks/1.json
  def update
    respond_to do |format|
      if @gawk.update(gawk_params)
        format.html { redirect_to @gawk, notice: 'Gawk was successfully updated.' }
        format.json { render :show, status: :ok, location: @gawk }
      else
        format.html { render :edit }
        format.json { render json: @gawk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gawks/1
  # DELETE /gawks/1.json
  def destroy
    @gawk.destroy
    respond_to do |format|
      format.html { redirect_to gawks_url, notice: 'Gawk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gawk
      @gawk = Gawk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gawk_params
      params.require(:gawk).permit(:message, :error_class)
    end
end
