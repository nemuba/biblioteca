class LivrosController < ApplicationController
  before_action :set_livro, only: %i[show edit update destroy]
  before_action :authenticate_usuario!
  # GET /livros
  # GET /livros.json
  def index
    @livros = if params[:search].present?
                Livro.search(params[:search]).page params[:page]
              else
                Livro.order(:autor).page params[:page]
    end
  end

  # GET /livros/1
  # GET /livros/1.json
  def show; end

  # GET /livros/new
  def new
    @livro = Livro.new
  end

  # GET /livros/1/edit
  def edit; end

  # POST /livros
  # POST /livros.json
  def create
    @livro = Livro.new(livro_params)

    respond_to do |format|
      if @livro.save
        format.html { redirect_to @livro, notice: t('.new', default: t('helpers.messages.new')) }
        format.json { render :show, status: :created, location: @livro }
      else
        format.html { render :new }
        format.json { render json: @livro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /livros/1
  # PATCH/PUT /livros/1.json
  def update
    respond_to do |format|
      if @livro.update(livro_params)
        format.html { redirect_to @livro, alert: t('.update', default: t('helpers.messages.update')) }
        format.json { render :show, status: :ok, location: @livro }
      else
        format.html { render :edit }
        format.json { render json: @livro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /livros/1
  # DELETE /livros/1.json
  def destroy
    @livro.destroy
    respond_to do |format|
      format.html { redirect_to livros_url, alert: t('.destroy', default: t('helpers.messages.destroy')) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_livro
    @livro = Livro.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def livro_params
    params.require(:livro).permit(:autor, :titulo, :ano_publicacao, :curso_id, :semestre_id, :materia_id, :search)
  end
end
