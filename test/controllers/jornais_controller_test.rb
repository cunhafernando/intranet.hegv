require "test_helper"

class JornaisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jornal = jornais(:one)
  end

  test "should get index" do
    get jornais_url
    assert_response :success
  end

  test "should get new" do
    get new_jornal_url
    assert_response :success
  end

  test "should create jornal" do
    assert_difference("Jornal.count") do
      post jornais_url, params: { jornal: { materia: @jornal.materia, titulo: @jornal.titulo } }
    end

    assert_redirected_to jornal_url(Jornal.last)
  end

  test "should show jornal" do
    get jornal_url(@jornal)
    assert_response :success
  end

  test "should get edit" do
    get edit_jornal_url(@jornal)
    assert_response :success
  end

  test "should update jornal" do
    patch jornal_url(@jornal), params: { jornal: { materia: @jornal.materia, titulo: @jornal.titulo } }
    assert_redirected_to jornal_url(@jornal)
  end

  test "should destroy jornal" do
    assert_difference("Jornal.count", -1) do
      delete jornal_url(@jornal)
    end

    assert_redirected_to jornais_url
  end
end
