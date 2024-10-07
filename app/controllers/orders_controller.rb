class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders or /orders.json
  def index
    @orders = current_user.orders.includes(:table, :dishes)
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = current_user.orders.new
    load_tables_and_dishes
  end

  # GET /orders/1/edit
  def edit
    load_tables_and_dishes
  end

  # POST /orders or /orders.json
  def create
    @order = current_user.orders.new(order_params.except(:dish_ids))

    respond_to do |format|
      if @order.save
        @order.dishes << Dish.where(id: order_params[:dish_ids].reject(&:blank?))
        if (table = Table.find_by(id: @order.table_id))
          table.update(available: false) if table.available?
        end
        format.html { redirect_to @order, notice: "Ordine creato con successo." }
        format.json { render :show, status: :created, location: @order }
      else
        load_tables_and_dishes
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      load_tables_and_dishes
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Ordine modificato con successo." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    table = @order.table
    @order.destroy
    table.update(available: true) if table.present?

    respond_to do |format|
      format.html { redirect_to orders_path, status: :see_other, notice: "Ordine eliminato con successo." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  def load_tables_and_dishes
    @tables = current_user.tables.order(:number)
    @dishes = current_user.dishes.order(:name)
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:table_id, :note, dish_ids: []).tap do |whitelisted|
      whitelisted[:dish_ids].reject!(&:blank?)
    end
  end
end
