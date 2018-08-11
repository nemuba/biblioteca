require "application_system_test_case"

class MateriasTest < ApplicationSystemTestCase
  setup do
    @materia = materias(:one)
  end

  test "visiting the index" do
    visit materias_url
    assert_selector "h1", text: "Materias"
  end

  test "creating a Materia" do
    visit materias_url
    click_on "New Materia"

    fill_in "Carga Horaria", with: @materia.carga_horaria
    fill_in "Curso", with: @materia.curso_id
    fill_in "Descricao", with: @materia.descricao
    click_on "Create Materia"

    assert_text "Materia was successfully created"
    click_on "Back"
  end

  test "updating a Materia" do
    visit materias_url
    click_on "Edit", match: :first

    fill_in "Carga Horaria", with: @materia.carga_horaria
    fill_in "Curso", with: @materia.curso_id
    fill_in "Descricao", with: @materia.descricao
    click_on "Update Materia"

    assert_text "Materia was successfully updated"
    click_on "Back"
  end

  test "destroying a Materia" do
    visit materias_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Materia was successfully destroyed"
  end
end
