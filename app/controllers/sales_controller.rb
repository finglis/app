class SalesController < ApplicationController
  before_action :set_sale, only: %i[ show edit update destroy request_finance ]

  # GET /Sales or /Sales.json
  def index
    @Sales = Sale.all
  end

  # GET /Sales/1 or /Sales/1.json
  def show
  end

  # GET /Sales/new
  def new
    @sale = Sale.new
    @sale.line_items.build
    @stores = Store.all
    @items = Item.all
    @customers = Customer.all
    @line_items = LineItem.all
  end

  # GET /Sales/1/edit
  def edit
    @customers = Customer.all
    @stores = Store.all
  end

  # POST /Sales or /Sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to sale_url(@sale), notice: "Sale was successfully created." }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Sales/1 or /Sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to sale_url(@sale), notice: "Sale was successfully updated." }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Sales/1 or /Sales/1.json
  def destroy
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to Sales_url, notice: "Sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def request_finance
    # insert logic to check finance should be approved
    sleep 3

    render :json => {approved: [true, false, true, true].sample}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id] || params[:sale_id])
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.require(:sale).permit(:customer_id, :item_id, :store_id)
    end
end
