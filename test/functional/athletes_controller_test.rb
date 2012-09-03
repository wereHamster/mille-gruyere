require 'test_helper'

class AthletesControllerTest < ActionController::TestCase
  setup do
    @athlete = athletes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:athletes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create athlete" do
    assert_difference('Athlete.count') do
      post :create, athlete: { gemeinde: @athlete.gemeinde, geschlecht: @athlete.geschlecht, jahrgang: @athlete.jahrgang, lizenz: @athlete.lizenz, nachname: @athlete.nachname, strasse: @athlete.strasse, verein: @athlete.verein, vorname: @athlete.vorname, zeit: @athlete.zeit }
    end

    assert_redirected_to athlete_path(assigns(:athlete))
  end

  test "should show athlete" do
    get :show, id: @athlete
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @athlete
    assert_response :success
  end

  test "should update athlete" do
    put :update, id: @athlete, athlete: { gemeinde: @athlete.gemeinde, geschlecht: @athlete.geschlecht, jahrgang: @athlete.jahrgang, lizenz: @athlete.lizenz, nachname: @athlete.nachname, strasse: @athlete.strasse, verein: @athlete.verein, vorname: @athlete.vorname, zeit: @athlete.zeit }
    assert_redirected_to athlete_path(assigns(:athlete))
  end

  test "should destroy athlete" do
    assert_difference('Athlete.count', -1) do
      delete :destroy, id: @athlete
    end

    assert_redirected_to athletes_path
  end
end
