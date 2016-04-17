require 'test_helper'

class VacationHomesControllerTest < ActionController::TestCase
  setup do
    @vacation_home = vacation_homes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vacation_homes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vacation_home" do
    assert_difference('VacationHome.count') do
      post :create, vacation_home: { business_id: @vacation_home.business_id, business_name: @vacation_home.business_name, max_occupancy: @vacation_home.max_occupancy, parking_spaces: @vacation_home.parking_spaces, property_address: @vacation_home.property_address, refuse_day: @vacation_home.refuse_day }
    end

    assert_redirected_to vacation_home_path(assigns(:vacation_home))
  end

  test "should show vacation_home" do
    get :show, id: @vacation_home
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vacation_home
    assert_response :success
  end

  test "should update vacation_home" do
    patch :update, id: @vacation_home, vacation_home: { business_id: @vacation_home.business_id, business_name: @vacation_home.business_name, max_occupancy: @vacation_home.max_occupancy, parking_spaces: @vacation_home.parking_spaces, property_address: @vacation_home.property_address, refuse_day: @vacation_home.refuse_day }
    assert_redirected_to vacation_home_path(assigns(:vacation_home))
  end

  test "should destroy vacation_home" do
    assert_difference('VacationHome.count', -1) do
      delete :destroy, id: @vacation_home
    end

    assert_redirected_to vacation_homes_path
  end
end
