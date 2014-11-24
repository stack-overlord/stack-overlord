class GawksController < ApplicationController
  include GawksHelper

  def show
    @address = Address.find_by(mash: params[:mash])
    last_gawk
  end

  def create # this needs to be changed to accomadate multiple save methods - GawkResultsGenerator
    @gawk = Gawk.new(gawk_params)
    mash = params[:mash]
    @gawk.address = Address.find_or_initialize_by(mash: mash)
    @gawk.save
    generator = GawkResultsGenerator.new(@gawk)
    generator.save_solutions
    partial_gawk = (render :partial => "gawks/single", :formats => [:html])
    broadcast(mash, partial_gawk)
    head 200
  end

  def update # this needs to be changed to save only messages - GawkResultsGenerator
    old_gawk = Gawk.find(params[:id])
    old_gawk.update(refined: params[:gawk][:refined])
    new_gawk = Gawk.create!(address_id: old_gawk.address_id, error_class: old_gawk.error_class, message: old_gawk.refined)
    generator = GawkResultsGenerator.new(new_gawk)
    generator.save_solutions
    @gawk = Gawk.last
    render :partial => "gawks/single", :formats => [:html]
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


