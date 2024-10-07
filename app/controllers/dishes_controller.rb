class DishesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dish, only: %i[ show edit update destroy ]

  # GET /dishes or /dishes.json
  def index
    @dishes = current_user.dishes.includes(:ingredients)
  end

  # GET /dishes/1 or /dishes/1.json
  def show
  end

  # GET /dishes/new
  def new
    @dish = current_user.dishes.new
    load_ingredients
  end

  # GET /dishes/1/edit
  def edit
    load_ingredients
  end

  # POST /dishes or /dishes.json
  def create
    @dish = current_user.dishes.new(dish_params)

    respond_to do |format|
      if @dish.save
        assign_ingredients
        format.html { redirect_to @dish, notice: "Portata aggiunta con successo." }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1 or /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        assign_ingredients
        format.html { redirect_to @dish, notice: "Portata modificata con successo." }
        format.json { render :show, status: :ok, location: @dish }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1 or /dishes/1.json
  def destroy
    begin
      @dish.destroy!
      respond_to do |format|
        format.html { redirect_to dishes_path, status: :see_other, notice: "Portata eliminata con successo." }
        format.json { head :no_content }
      end
    rescue ActiveRecord::RecordNotDestroyed => e
      respond_to do |format|
        format.html { redirect_to dishes_path, status: :unprocessable_entity, alert: "Errore nell'eliminazione della portata: #{e.message}" }
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    def load_ingredients
      @ingredients = current_user.ingredients.order(:name)
    end

    # Assign ingredients to the dish
    def assign_ingredients
      ingredient_ids = params[:dish][:ingredient_ids].reject(&:blank?)
      @dish.ingredient_ids = ingredient_ids
    end

    # Only allow a list of trusted parameters through.
    def dish_params
      params.require(:dish).permit(:name, {ingredient_ids: []}, :note)
    end
end
