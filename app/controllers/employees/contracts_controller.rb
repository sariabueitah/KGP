class Employees::ContractsController < ApplicationController
  before_action :set_contract, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[ new index create ]

  def contracts_index
    @contracts = Contract.all
  end

  def index
    @search = params[:q]
    @contracts = if @search.blank?
      @employee.contracts
    else
      @employee.contracts
    end
  end

  def new
    @contract = @employee.contracts.build
  end

  def show
  end

  def create
    @contract = @employee.contracts.build(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to employee_contract_url(@contract), notice: "Contract was successfully created." }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to employee_contract_url(@contract), notice: "Contract was successfully updated." }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def destroy
    @contract.destroy!

    respond_to do |format|
      format.html { redirect_to employee_contracts_url(@contract.employee_id), notice: "Contract was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_contract
    @contract = Contract.find(params[:id])
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end
  def contract_params
    params.require(:contract).permit(:start_date, :end_date, :salary, :active, :position_id)
  end
end
