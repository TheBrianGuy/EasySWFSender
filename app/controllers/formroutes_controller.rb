class FormroutesController < ApplicationController
  before_action :set_formroute, only: [:show, :edit, :update, :destroy]
  rescue_from ActionController::RoutingError, with: :newhttp

  # handles 422 (Unprocessable Entity)
  skip_before_filter :verify_authenticity_token, only: [:newhttp]

  def newhttp
    begin
      data, errors = Formroute.authenticateMessage(request, params)
    rescue => e
      render status: 500, json: {"codeErrors": ["Code error, Check Server Logs", "#{e}"]}
    else
      if errors[:codeErrors].size == 0 
        render status: 200, json: errors
      else
        render status: 400, json: errors
      end
    end
  end

  # GET /formroutes
  # GET /formroutes.json
  def index
    @formroutes = Formroute.all
  end

  # GET /formroutes/1
  # GET /formroutes/1.json
  def show
  end

  # GET /formroutes/new
  def new
    @formroute = Formroute.new
  end

  # GET /formroutes/1/edit
  def edit
  end

  # POST /formroutes
  # POST /formroutes.json
  def create
    @formroute = Formroute.new(formroute_params)

    respond_to do |format|
      if @formroute.save
        format.html { redirect_to @formroute, notice: 'Formroute was successfully created.' }
        format.json { render :show, status: :created, location: @formroute }
      else
        format.html { render :new }
        format.json { render json: @formroute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formroutes/1
  # PATCH/PUT /formroutes/1.json
  def update
    respond_to do |format|
      if @formroute.update(formroute_params)
        format.html { redirect_to @formroute, notice: 'Formroute was successfully updated.' }
        format.json { render :show, status: :ok, location: @formroute }
      else
        format.html { render :edit }
        format.json { render json: @formroute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formroutes/1
  # DELETE /formroutes/1.json
  def destroy
    @formroute.destroy
    respond_to do |format|
      format.html { redirect_to formroutes_url, notice: 'Formroute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formroute
      @formroute = Formroute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formroute_params
      params.require(:formroute).permit(:name, :page, :fwd_to_email)
    end
end