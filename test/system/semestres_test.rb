require "application_system_test_case"

class SemestresTest < ApplicationSystemTestCase
  setup do
    @semestr = semestres(:one)
  end

  test "visiting the index" do
    visit semestres_url
    assert_selector "h1", text: "Semestres"
  end

  test "creating a Semestre" do
    visit semestres_url
    click_on "New Semestre"

    fill_in "Descricao", with: @semestr.descricao
    click_on "Create Semestre"

    assert_text "Semestre was successfully created"
    click_on "Back"
  end

  test "updating a Semestre" do
    visit semestres_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @semestr.descricao
    click_on "Update Semestre"

    assert_text "Semestre was successfully updated"
    click_on "Back"
  end

  test "destroying a Semestre" do
    visit semestres_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Semestre was successfully destroyed"
  end
end
