class MutantesController < ApplicationController
  before_action :login, except: %i[create]

  def index
    render json: {msg: 'welcome message'}
  end

  # GET mutantes/1
  def show; end

  def create
    @mutant = Mutante.new(mutante_params)
    if @mutant.login.nil? || @mutant.password.nil?
      return api_bad_request('login and password required')
    end

    if @mutant.save
      render json: @mutant, status: :created, location: @mutant
    else
      render json: @mutant.errors, status: :unprocessable_entity
    end
  end

  def update
    if @mutant.update(mutante_params)
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

  def mutante_params
    params.require(:mutante).permit(:name,
                                    :password,
                                    :hability, :login, :picture)
  end
end
