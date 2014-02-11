class PeerGroupsController < ApplicationController
  before_action :set_peer_group, only: [:show, :edit, :update, :destroy]

  # GET /peer_groups
  # GET /peer_groups.json
  def index
    @peer_groups = PeerGroup.all
  end

  # GET /peer_groups/1
  # GET /peer_groups/1.json
  def show
  end

  # GET /peer_groups/new
  def new
    @peer_group = PeerGroup.new
  end

  # GET /peer_groups/1/edit
  def edit
  end

  # POST /peer_groups
  # POST /peer_groups.json
  def create
    @peer_group = PeerGroup.new(peer_group_params)

    respond_to do |format|
      if @peer_group.save
        format.html { redirect_to @peer_group, notice: 'Peer group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @peer_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @peer_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peer_groups/1
  # PATCH/PUT /peer_groups/1.json
  def update
    respond_to do |format|
      if @peer_group.update(peer_group_params)
        format.html { redirect_to @peer_group, notice: 'Peer group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @peer_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peer_groups/1
  # DELETE /peer_groups/1.json
  def destroy
    @peer_group.destroy
    respond_to do |format|
      format.html { redirect_to peer_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peer_group
      @peer_group = PeerGroup.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def peer_group_params
      params.require(:peer_group).permit(:key)
    end
end
