class GawksController < ApplicationController
  include GawksHelper

  def show
    @address = Address.find_by(mash: params[:mash])
    last_gawk
  end

  def create
    @gawk = Gawk.new(gawk_params)
    mash = params[:address_id]
    @gawk.address = Address.find_or_initialize_by(mash: mash)
    @gawk.save
    generator = GawkResultsGenerator.new(@gawk)
    generator.save_solutions
    partial_gawk = (render :partial => "gawks/single", :formats => [:html])
    broadcast(mash, partial_gawk)
    head 200
  end

  private
    def last_gawk
      @gawk = @address.gawks.last
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gawk_params
      params.require(:gawk).permit(:message, :error_class)
    end
end


