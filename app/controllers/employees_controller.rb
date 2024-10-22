class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

    def new
      @employee = Employee.new
    end

    def index
      @search = params[:q]
      @employees = if @search.blank?
        Employee.all
      else
        Employee.search_employee(params[:q])
      end
    end

    def show
    end

    def create
      @employee = Employee.new(employee_params)

      respond_to do |format|
        if @employee.save
          format.html { redirect_to employees_url(@employee), notice: "Employee was successfully created." }
          format.json { render :show, status: :created, location: @employee }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @employee.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @employee.update(employee_params)
          format.html { redirect_to employees_url(@employee), notice: "Employee was successfully updated." }
          format.json { render :show, status: :ok, location: @employee }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @employee.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
    end

    def destroy
      @employee.destroy!

      respond_to do |format|
        format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      def set_employee
        @employee = Employee.find(params[:id])
      end

      def employee_params
        params.require(:employee).permit(:first_name, :father_name, :grandfather_name, :family_name, :ar_first_name, :ar_father_name, :ar_grandfather_name, :ar_family_name, :nid, :email, :phone_number, :e_phone_number, :national, :passport_number, :nationality)
      end
end
