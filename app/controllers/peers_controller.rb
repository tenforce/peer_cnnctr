class PeersController < ApplicationController
  before_action :set_peer_group
  before_action :set_peer, only: [:show, :edit, :update, :destroy]

  # GET /peers
  # GET /peers.json
  def index
    @peers = Peer.all
  end

  # GET /peers/1
  # GET /peers/1.json
  def show
  end

  # GET /peers/new
  def new
    @peer = Peer.new
  end

  # GET /peers/1/edit
  def edit
  end

  # POST /peers
  # POST /peers.json
  def create
    @peer = Peer.new(peer_params)

    respond_to do |format|
      if @peer.save
        format.html { redirect_to [@peer_group,@peer], notice: 'Peer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @peer }
      else
        format.html { render action: 'new' }
        format.json { render json: @peer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peers/1
  # PATCH/PUT /peers/1.json
  def update
    respond_to do |format|
      if @peer.update(peer_params)
        format.html { redirect_to [@peer_group,@peer], notice: 'Peer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @peer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peers/1
  # DELETE /peers/1.json
  def destroy
    @peer.destroy
    respond_to do |format|
      format.html { redirect_to peer_group_peers_url( @peer_group ) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peer
      @peer = Peer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def peer_params
      params.require(:peer).permit(:contact_point, :peer_group_id)
    end

    # Set the peer group as we are a nested resource
    def set_peer_group
      @peer_group = PeerGroup.friendly.find(params[:peer_group_id])
    end
end
