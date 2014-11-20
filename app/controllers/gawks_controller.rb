class GawksController < ApplicationController
  before_action :set_gawk, only: [:show, :edit, :update, :destroy]

  def index
    @gawks = Gawk.all
  end

  def show
    @address = Address.find_by(mash: params[:mash])
    last_gawk
  end

  def create
    @gawk = Gawk.new(gawk_params)
    address = Address.new(mash: params[:address])
    respond_to do |format|
      if @gawk.save
        address.save
        @gawk.triggers.create(address: address)
        format.html { redirect_to @gawk, notice: 'Gawk was successfully created.' }
        format.json { render :show, status: :created, location: @gawk }
      else
        format.html { render :new }
        format.json { render json: @gawk.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def last_gawk
      @gawk = @address.gawks.last
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gawk_params
      params.require(:gawk).permit(:message, :error_class)
    end
end
