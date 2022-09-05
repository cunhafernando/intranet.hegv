require "application_system_test_case"

class NoticiasTest < ApplicationSystemTestCase
  setup do
    @noticia = noticias(:one)
  end

  test "visiting the index" do
    visit noticias_url
    assert_selector "h1", text: "Noticias"
  end

  test "should create noticia" do
    visit noticias_url
    click_on "New noticia"

    fill_in "Arquivo", with: @noticia.arquivo
    fill_in "Texto", with: @noticia.texto
    fill_in "Titulo", with: @noticia.titulo
    click_on "Create Noticia"

    assert_text "Noticia was successfully created"
    click_on "Back"
  end

  test "should update Noticia" do
    visit noticia_url(@noticia)
    click_on "Edit this noticia", match: :first

    fill_in "Arquivo", with: @noticia.arquivo
    fill_in "Texto", with: @noticia.texto
    fill_in "Titulo", with: @noticia.titulo
    click_on "Update Noticia"

    assert_text "Noticia was successfully updated"
    click_on "Back"
  end

  test "should destroy Noticia" do
    visit noticia_url(@noticia)
    click_on "Destroy this noticia", match: :first

    assert_text "Noticia was successfully destroyed"
  end
end
