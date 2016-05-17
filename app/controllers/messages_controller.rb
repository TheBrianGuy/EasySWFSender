class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    route_ids = Formroute.where(user_id: current_user).map {|route| route.id}
    allMessages = Message.where(formroute_id: route_ids).reverse_order
    routeMessages =  Message.where(formroute_id: params[:formroute_id]).reverse_order

    params[:formroute_id] == nil ? @messages = allMessages : @messages = routeMessages
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end
end
