class MateriasController < ApplicationController
  before_action :set_materia, only: %i[show edit update destroy]
  before_action :authenticate_usuario!
  # GET /materias
  # GET /materias.json
  def index
    @materias = if params[:search].present?
                  Materia.search(params[:search]).page params[:page]
                else
                  Materia.order(:descricao).page params[:page]
    end
  end

  # GET /materias/1
  # GET /materias/1.json
  def show; end

  # GET /materias/new
  def new
    @materia = Materia.new
  end

  # GET /materias/1/edit
  def edit; end

  # POST /materias
  # POST /materias.json
  def create
    @materia = Materia.new(materia_params)

    respond_to do |format|
      if @materia.save
        format.html { redirect_to @materia, notice: t('.new', default: t('helpers.messages.new')) }
        format.json { render :show, status: :created, location: @materia }
      else
        format.html { render :new }
        format.json { render json: @materia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materias/1
  # PATCH/PUT /materias/1.json
  def update
    respond_to do |format|
      if @materia.update(materia_params)
        format.html { redirect_to @materia, notice: t('.update', default: t('helpers.messages.update')) }
        format.json { render :show, status: :ok, location: @materia }
      else
        format.html { render :edit }
        format.json { render json: @materia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materias/1
  # DELETE /materias/1.json
  def destroy
    @materia.destroy
    respond_to do |format|
      format.html { redirect_to materias_url, notice: t('.destroy', default: t('helpers.messages.destroy')) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_materia
    @materia = Materia.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def materia_params
    params.require(:materia).permit(:descricao, :carga_horaria, :curso_id, :search)
  end
end
