class Employees::BanksController < ApplicationController
  before_action :set_bank, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[ new index create ]

  def index
    @bank = @employee.bank
  end

  def new
    @bank = @employee.build_bank
  end

  def show
  end

  def create
    @bank = @employee.build_bank(bank_params)

    respond_to do |format|
      if @bank.save
        format.html { redirect_to employee_bank_url(@bank), notice: "Bank was successfully created." }
        format.json { render :show, status: :created, location: @bank }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bank.update(bank_params)
        format.html { redirect_to employee_bank_url(@bank), notice: "Bank was successfully updated." }
        format.json { render :show, status: :ok, location: @bank }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def destroy
    @bank.destroy!

    respond_to do |format|
      format.html { redirect_to employee_banks_url(@bank.employee_id), notice: "Bank was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_bank
    @bank = Bank.find(params[:id])
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def bank_params
    params.require(:bank).permit(:name, :branch, :iban)
  end
end
