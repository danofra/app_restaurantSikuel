class IngredientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ingredient, only: %i[ show edit update destroy ]

  # GET /ingredients or /ingredients.json
  def index
    @ingredients = current_user.ingredients
  end

  # GET /ingredients/1 or /ingredients/1.json
  def show
  end

  # GET /ingredients/new
  def new
    @ingredient = current_user.ingredients.new 
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients or /ingredients.json
  def create
    @ingredient = current_user.ingredients.new(ingredient_params) 

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: "Ingrediente aggiunto con successo." }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1 or /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: "Ingrediente modificato con successo." }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1 or /ingredients/1.json
  def destroy
    begin
      @ingredient.destroy
      respond_to do |format|
        format.html { redirect_to ingredients_path, status: :see_other, notice: "Ingrediente eliminato con successo." }
        format.json { head :no_content }
      end
    rescue ActiveRecord::RecordNotDestroyed => e
      respond_to do |format|
        format.html { redirect_to ingredients_path, status: :unprocessable_entity, alert: "Errore nell'eliminazione dell'ingrediente: #{e.message}" }
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :stock)
    end
end
