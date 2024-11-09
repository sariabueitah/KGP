class Employees::AdvancesController < ApplicationController
  before_action :set_advance, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[ new index create ]

  def advances_index
    @advances = Advance.all
  end

  def index
    @search = params[:q]
    @advances = if @search.blank?
      @employee.advances
    else
      @employee.advances
    end
  end

  def new
    @advance = @employee.advances.build
  end

  def show
  end

  def create
    @advance = @employee.advances.build(advance_params)

    respond_to do |format|
      if @advance.save
        format.html { redirect_to employee_advance_url(@advance), notice: "Advance was successfully created." }
        format.json { render :show, status: :created, location: @advance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @advance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @advance.update(advance_params)
        format.html { redirect_to employee_advance_url(@advance), notice: "Advance was successfully updated." }
        format.json { render :show, status: :ok, location: @advance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @advance.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def destroy
    @advance.destroy!

    respond_to do |format|
      format.html { redirect_to employee_advances_url(@advance.employee_id), notice: "Advance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_advance
    @advance = Advance.find(params[:id])
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end
  def advance_params
    params.require(:advance).permit(:amount, :payment, :start_date, :end_date)
  end
end
