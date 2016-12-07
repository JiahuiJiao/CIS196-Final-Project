# Request controller
class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :accept_request]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new/{#current_user}/{#target_user}
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(from_id: current_user.id, to_id: params[:user_id])
    respond_to do |format|
      if @request.save
        format.html { redirect_to current_user, notice: 'Friend request successfully sent.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept_request
    from_user = User.find(@request.from_id)
    to_user = User.find(@request.to_id)
    from_user.friends.append(to_user)
    to_user.friends.append(from_user)
    @request.destroy

    respond_to do |format|
      format.html { redirect_to current_user, notice: 'You have accepted the friend request.' }
      format.json { head :no_content }
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @respondent = User.find(@request.to_id)
    @request.destroy
    respond_to do |format|
      format.html { redirect_to @respondent, notice: 'You have declined the friend request.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_params
    params.require(:request).permit(:from_id, :to_id)
  end
end
