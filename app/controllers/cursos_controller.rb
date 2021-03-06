class CursosController < ApplicationController
  before_action :set_curso, only: %i[show edit update destroy]
  before_action :authenticate_usuario!
  # GET /cursos
  # GET /cursos.json
  def index
    @cursos = if params[:search].present?
                Curso.search(params[:search]).page params[:page]
              else
                Curso.order(:descricao).page params[:page]
    end
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show; end

  # GET /cursos/new
  def new
    @curso = Curso.new
  end

  # GET /cursos/1/edit
  def edit; end

  # POST /cursos
  # POST /cursos.json
  def create
    @curso = Curso.new(curso_params)

    respond_to do |format|
      if @curso.save
        format.html { redirect_to @curso, notice: t('.new', default: t('helpers.messages.new')) }
        format.json { render :show, status: :created, location: @curso }
      else
        format.html { render :new }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
    respond_to do |format|
      if @curso.update(curso_params)
        format.html { redirect_to @curso, notice: t('.update', default: t('helpers.messages.update')) }
        format.json { render :show, status: :ok, location: @curso }
      else
        format.html { render :edit }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to cursos_url, notice: t('.destroy', default: t('helpers.messages.destroy')) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_curso
    @curso = Curso.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def curso_params
    params.require(:curso).permit(:descricao, :duracao, :periodo, :semestre_id, :search)
  end
end
