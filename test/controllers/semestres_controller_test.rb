require 'test_helper'

class SemestresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @semestr = semestres(:one)
  end

  test "should get index" do
    get semestres_url
    assert_response :success
  end

  test "should get new" do
    get new_semestr_url
    assert_response :success
  end

  test "should create semestr" do
    assert_difference('Semestre.count') do
      post semestres_url, params: { semestr: { descricao: @semestr.descricao } }
    end

    assert_redirected_to semestr_url(Semestre.last)
  end

  test "should show semestr" do
    get semestr_url(@semestr)
    assert_response :success
  end

  test "should get edit" do
    get edit_semestr_url(@semestr)
    assert_response :success
  end

  test "should update semestr" do
    patch semestr_url(@semestr), params: { semestr: { descricao: @semestr.descricao } }
    assert_redirected_to semestr_url(@semestr)
  end

  test "should destroy semestr" do
    assert_difference('Semestre.count', -1) do
      delete semestr_url(@semestr)
    end

    assert_redirected_to semestres_url
  end
end
