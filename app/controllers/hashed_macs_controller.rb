class HashedMacsController < ApplicationController
  before_action :set_hashed_mac, only: [:show, :edit, :update, :destroy]

  # GET /hashed_macs
  # GET /hashed_macs.json
  def index
    @hashed_macs = HashedMac.all
  end

  # GET /hashed_macs/1
  # GET /hashed_macs/1.json
  def show
  end

  # GET /hashed_macs/new
  def new
    @hashed_mac = HashedMac.new
  end

  # GET /hashed_macs/1/edit
  def edit
  end

  # POST /hashed_macs
  # POST /hashed_macs.json
  def create
    @hashed_mac = HashedMac.new(hashed_mac_params)

    respond_to do |format|
      if @hashed_mac.save
        format.html { redirect_to @hashed_mac, notice: 'Hashed mac was successfully created.' }
        format.json { render :show, status: :created, location: @hashed_mac }
      else
        format.html { render :new }
        format.json { render json: @hashed_mac.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hashed_macs/1
  # PATCH/PUT /hashed_macs/1.json
  def update
    respond_to do |format|
      if @hashed_mac.update(hashed_mac_params)
        format.html { redirect_to @hashed_mac, notice: 'Hashed mac was successfully updated.' }
        format.json { render :show, status: :ok, location: @hashed_mac }
      else
        format.html { render :edit }
        format.json { render json: @hashed_mac.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hashed_macs/1
  # DELETE /hashed_macs/1.json
  def destroy
    @hashed_mac.destroy
    respond_to do |format|
      format.html { redirect_to hashed_macs_url, notice: 'Hashed mac was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hashed_mac
      @hashed_mac = HashedMac.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hashed_mac_params
      params[:hashed_mac]
    end
end
