class PlansController < ApplicationController
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

    #if plan_params[:content] != ""
    if params.key?("content")
      if @plan.save
        render json: @plan, status: :ok, location: @plan
      else
        render json: @plan.errors, status: :unprocessable_entity
      end
    else
      render :status => :method_not_allowed, :text => "Invalid Input"
    end
  end

  # PATCH/PUT /plans/1
  def update
    if params.key?("content")
      if @plan.update(plan_params)
        render json: @plan
      else
        render json: @plan.errors, status: :unprocessable_entity
      end
    else
      render :status => :method_not_allowed, :text => "Invalid Input"
    end
  end

  # DELETE /plans/1
  def destroy
    if params.key?("id")
      @plan.destroy
      render json: @plan, status: :ok, location: @plan
    else
      render :status => :method_not_allowed, :text => "Invalid Input"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      if Plan.exists?(params[:id])
        @plan = Plan.find(params[:id])
      else
        render :status => :not_found, :text => "ID not found"
      end
    end

    # Only allow a trusted parameter "white list" through.
    def plan_params
      #params.require(:plan).permit(:content)
      params.permit(:content)
    end
end
