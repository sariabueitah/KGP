class Contracts::AllowancesController < ApplicationController
  before_action :set_contracts_allowance, only: %i[ show edit update destroy ]

  # GET /contracts/allowances or /contracts/allowances.json
  def index
    @contracts_allowances = Contracts::Allowance.all
  end

  # GET /contracts/allowances/1 or /contracts/allowances/1.json
  def show
  end

  # GET /contracts/allowances/new
  def new
    @contracts_allowance = Contracts::Allowance.new
  end

  # GET /contracts/allowances/1/edit
  def edit
  end

  # POST /contracts/allowances or /contracts/allowances.json
  def create
    @contracts_allowance = Contracts::Allowance.new(contracts_allowance_params)

    respond_to do |format|
      if @contracts_allowance.save
        format.html { redirect_to @contracts_allowance, notice: "Allowance was successfully created." }
        format.json { render :show, status: :created, location: @contracts_allowance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contracts_allowance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/allowances/1 or /contracts/allowances/1.json
  def update
    respond_to do |format|
      if @contracts_allowance.update(contracts_allowance_params)
        format.html { redirect_to @contracts_allowance, notice: "Allowance was successfully updated." }
        format.json { render :show, status: :ok, location: @contracts_allowance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contracts_allowance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/allowances/1 or /contracts/allowances/1.json
  def destroy
    @contracts_allowance.destroy!

    respond_to do |format|
      format.html { redirect_to contracts_allowances_path, status: :see_other, notice: "Allowance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contracts_allowance
      @contracts_allowance = Contracts::Allowance.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def contracts_allowance_params
      params.fetch(:contracts_allowance, {})
    end
end
