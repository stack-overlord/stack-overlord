class AddressesController < ApplicationController
  before_action :set_mash, only: [:show, :edit, :update, :destroy]

  def show
    @address = Address.find_by(mash: params[:address_id])
  end

  def create
    @mash = HashedMac.new(mash_params)

    respond_to do |format|
      if @mash.save
        format.html { redirect_to @mash, notice: 'Hashed mac was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def mash_params
      params[:mash]
    end
end
