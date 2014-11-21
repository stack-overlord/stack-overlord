# require_relative '../models/stack_overflow_client'

# load 'stack_overflow_client'

class GawksController < ApplicationController

  def refresh
    @address = Gawk.find(params[:id]).address
    last_gawk
    render :partial => "gawks/single"
  end

  def show
    @address = Address.find_by(mash: params[:mash])
    last_gawk
  end

  def create
    @gawk = Gawk.new(gawk_params)
    @gawk.address = Address.find_or_initialize_by(mash: params[:address_id])
    @gawk.save
    generator = GawkResultsGenerator.new(@gawk)
    # binding.pry
    generator.save_solutions
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


