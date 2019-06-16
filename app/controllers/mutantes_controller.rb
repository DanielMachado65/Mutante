class MutantesController < ApplicationController
  before_action :login
  before_action :set_mutant, only: %i[show destroy update]

  def index
    render json: @user.mutantes.as_json
  end

  def show; end

  def create
    @mutant = Mutante.new(mutante_params)
    @user.mutantes << @mutant
    if @mutant.save
      render json: @mutant, status: :created, location: @mutant
    else
      render json: @mutant.errors, status: :unprocessable_entity
    end
  end

  def update
    if @mutant.update(name: params[:name],
                      hability: params[:hability],
                      picture: params[:picture],
                      user: @user)
      render json: @mutant
    else
      render json: @mutant.errors, status: :unprocessable_entity
    end
  end

  # DELETE mutantes/1
  def destroy
    @mutant.destroy ? api_success('success') : api_unauthorized('not possible')
  end

  private

  def set_mutant
    @mutant = Mutante.where(id: params[:id]).first
    render json: {error: 'not found mutant'}.to_json if @mutant.nil?
  end

  def mutante_params
    params.require(:mutante).permit(:name,
                                    :hability, :picture)
  end
end
