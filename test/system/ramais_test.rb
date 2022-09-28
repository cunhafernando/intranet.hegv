require "application_system_test_case"

class RamaisTest < ApplicationSystemTestCase
  setup do
    @ramal = ramais(:one)
  end

  test "visiting the index" do
    visit ramais_url
    assert_selector "h1", text: "Ramais"
  end

  test "should create ramal" do
    visit ramais_url
    click_on "New ramal"

    fill_in "Departamento", with: @ramal.departamento
    fill_in "Email", with: @ramal.email
    fill_in "Setor", with: @ramal.setor
    fill_in "Telefone", with: @ramal.telefone
    click_on "Create Ramal"

    assert_text "Ramal was successfully created"
    click_on "Back"
  end

  test "should update Ramal" do
    visit ramal_url(@ramal)
    click_on "Edit this ramal", match: :first

    fill_in "Departamento", with: @ramal.departamento
    fill_in "Email", with: @ramal.email
    fill_in "Setor", with: @ramal.setor
    fill_in "Telefone", with: @ramal.telefone
    click_on "Update Ramal"

    assert_text "Ramal was successfully updated"
    click_on "Back"
  end

  test "should destroy Ramal" do
    visit ramal_url(@ramal)
    click_on "Destroy this ramal", match: :first

    assert_text "Ramal was successfully destroyed"
  end
end
