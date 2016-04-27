class PlansController < ApplicationController
  before_action :check_content, only: [:create, :update]
  before_action :check_id, only: [:show, :update, :destroy]

  before_action :set_plan, only: [:show, :update, :destroy]

  # GET /plans
  def index
    #@plans = Plan.all
    #render json: @plans
    render :status => :method_not_allowed, :text => "Invalid Input"
  end

  # GET /plans/1
  def show
    render json: @plan
  end

  # POST /plans
  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      render json: @plan, status: :ok, location: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plans/1
  def update
    if @plan.update(plan_params)
      render json: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plans/1
  def destroy
    if params.key?("id")
      @plan.destroy
      render nothing: true, status: :ok
    else
      render :status => :method_not_allowed, :text => "Invalid Input"
    end
  end

  private
    def check_id
      # Prueft, ob ID gueltig ist -> nur Zahlen
      if plan_params[:id] !~ /^(?<num>\d+)$/
        render :status => :method_not_allowed, :text => "Invalid ID"
      else
        # Prueft, ob ID existiert in DB
        render :status => :not_found, :text => "ID not found" if !Plan.exists?(params[:id])
      end
    end

    # Prueft ob JSON das Feld "content" enthaelt
    def check_content
      if !params.key?("content")
        render :status => :method_not_allowed, :text => "content field expected"
      else
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plan_params
      #params.require(:plan).permit(:content)
      params.permit(:id, :content)
    end
end
