require "application_system_test_case"

class JornaisTest < ApplicationSystemTestCase
  setup do
    @jornal = jornais(:one)
  end

  test "visiting the index" do
    visit jornais_url
    assert_selector "h1", text: "Jornais"
  end

  test "should create jornal" do
    visit jornais_url
    click_on "New jornal"

    fill_in "Materia", with: @jornal.materia
    fill_in "Titulo", with: @jornal.titulo
    click_on "Create Jornal"

    assert_text "Jornal was successfully created"
    click_on "Back"
  end

  test "should update Jornal" do
    visit jornal_url(@jornal)
    click_on "Edit this jornal", match: :first

    fill_in "Materia", with: @jornal.materia
    fill_in "Titulo", with: @jornal.titulo
    click_on "Update Jornal"

    assert_text "Jornal was successfully updated"
    click_on "Back"
  end

  test "should destroy Jornal" do
    visit jornal_url(@jornal)
    click_on "Destroy this jornal", match: :first

    assert_text "Jornal was successfully destroyed"
  end
end
