require 'test_helper'

class MutantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mutante = mutantes(:one)
  end

  test "should get index" do
    get mutantes_url, as: :json
    assert_response :success
  end

  test "should create mutante" do
    assert_difference('Mutante.count') do
      post mutantes_url, params: { mutante: { hability: @mutante.hability, login: @mutante.login, name: @mutante.name, password: @mutante.password, picture: @mutante.picture } }, as: :json
    end

    assert_response 201
  end

  test "should show mutante" do
    get mutante_url(@mutante), as: :json
    assert_response :success
  end

  test "should update mutante" do
    patch mutante_url(@mutante), params: { mutante: { hability: @mutante.hability, login: @mutante.login, name: @mutante.name, password: @mutante.password, picture: @mutante.picture } }, as: :json
    assert_response 200
  end

  test "should destroy mutante" do
    assert_difference('Mutante.count', -1) do
      delete mutante_url(@mutante), as: :json
    end

    assert_response 204
  end
end
