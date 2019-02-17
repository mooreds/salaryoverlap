class SalaryDataController < ApplicationController
  before_action :set_salary_datum, only: [:show, :edit, :update, :destroy]

  # GET /salary_data
  # GET /salary_data.json
  def index
    @salary_data = SalaryDatum.all
  end

  # GET /salary_data/1
  # GET /salary_data/1.json
  def show
  end

  # GET /salary_data/new
  def new
    @salary_datum = SalaryDatum.new
  end

  # GET /salary_data/1/edit
  def edit
  end

  # POST /salary_data
  # POST /salary_data.json
  def create
    @salary_datum = SalaryDatum.new(salary_datum_params)
    respond_to do |format|
      if @salary_datum.save
        format.html { redirect_to @salary_datum, notice: 'Salary datum was successfully created.' }
        format.json { render :show, status: :created, location: @salary_datum }
      else
        format.html { render :new }
        format.json { render json: @salary_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salary_data/1
  # PATCH/PUT /salary_data/1.json
  def update
    respond_to do |format|
      if @salary_datum.update(salary_datum_params)
        format.html { redirect_to @salary_datum, notice: 'Salary datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @salary_datum }
      else
        format.html { render :edit }
        format.json { render json: @salary_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salary_data/1
  # DELETE /salary_data/1.json
  def destroy
    @salary_datum.destroy
    respond_to do |format|
      format.html { redirect_to salary_data_url, notice: 'Salary datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salary_datum
      @salary_datum = SalaryDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salary_datum_params
      params.require(:salary_datum).permit(:email, :low, :high, :is_employer, :salary_overlap_id)
    end
end
