class SalasController < ApplicationController
  #before_action :authenticate_user!
  before_action :authorize_sala, only: [:show, :edit, :update, :destroy] 
  before_action :set_sala, only: [:show, :edit, :update, :destroy]

  # GET /salas
  # GET /salas.json
  def index
    #authorize Sala
    @salas =  policy_scope(Sala).all
    @messages = Message.order(created_at: :asc)
  end

  # GET /salas/1
  # GET /salas/1.json
  def show
    #@messages = Message.all
    @messages = Message.page(params[:page]).per(20).order(created_at: :asc)
    #@message_user = current_user.id
    #@message_sala = @sala.id
    #@sala = Sala.includes(:messages).find_by(id: params[:id])
    #@message = Message.new
    #@messages = Sala.includes(:messages).find_by(id: params[:sala_id])
    #@messages = Message.page(params[:page]).per(10).order(created_at: :asc)
    @participantes = @sala.participantes.build
  end

  # GET /salas/new
  def new
    @sala = Sala.new
    #@sala.adm_id = current_user.id
    @sala.build_adm
    #@sala.users.build
    #@participante = @sala.participantes.build
    @user = @sala.users.build
    #@adm = @sala.adms.build
  end

  # GET /salas/1/edit
  def edit
    #@sala.adm_id = current_user.id
  end

  # POST /salas
  # POST /salas.json
  def create
    #@sala = current_user.salas.build(sala_params)
    @sala = Sala.new(sala_params)
    #@sala.build_adm
    #@adm = Adm.new(adm_params)
    #@adm = Adm.new(params[:adm])
    #@sala.adm_id = current_user.id  # Preenchendo o campo com o id

    respond_to do |format|
      if @sala.save
        format.html { redirect_to @sala, notice: 'Sala was successfully created.' }
        format.json { render :show, status: :created, location: @sala }
      else
        format.html { render :new }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salas/1
  # PATCH/PUT /salas/1.json
  def update
    respond_to do |format|
      if @sala.update(sala_params)
        format.html { redirect_to @sala, notice: 'Sala was successfully updated.' }
        format.json { render :show, status: :ok, location: @sala }
      else
        format.html { render :edit }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salas/1
  # DELETE /salas/1.json
  def destroy
    @sala.destroy
    respond_to do |format|
      format.html { redirect_to salas_url, notice: 'Sala was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sala
      @sala = Sala.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sala_params
      params.require(:sala).permit(:nome, :descricao, :ativa, :adm_id, adm_attributes: [:id, :user_id, :_destroy, users_attributes: [:id, :email, :nome, :age]], participantes_attributes: [:id, :user_id, :sala_id, :_destroy], users_attributes: [:id, :email, :nome, :age, :password, :password_confirmation, :current_password])
    end

    def authorize_sala
      authorize Sala
    end
    #def adm_params
    #  params.require(:adm).permit(:user_id)
    #end
end
