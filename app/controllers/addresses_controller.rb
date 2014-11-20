class AddressesController < ApplicationController
  before_action :set_mash, only: [:show, :edit, :update, :destroy]

  def create
    @mash = HashedMac.new(mash_params)

    respond_to do |format|
      if @mash.save
        format.html { redirect_to @mash, notice: 'Hashed mac was successfully created.' }
        format.json { render :show, status: :created, location: @mash }
      else
        format.html { render :new }
        format.json { render json: @mash.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def mash_params
      params[:mash]
    end
end


get "/:mash" do

end
