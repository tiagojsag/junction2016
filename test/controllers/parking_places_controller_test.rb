require 'test_helper'

class ParkingPlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_place = parking_places(:one)
  end

  test "should get index" do
    get parking_places_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_place_url
    assert_response :success
  end

  test "should create parking_place" do
    assert_difference('ParkingPlace.count') do
      post parking_places_url, params: { parking_place: { description: @parking_place.description, latitude: @parking_place.latitude, longitude: @parking_place.longitude, title: @parking_place.title } }
    end

    assert_redirected_to parking_place_url(ParkingPlace.last)
  end

  test "should show parking_place" do
    get parking_place_url(@parking_place)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_place_url(@parking_place)
    assert_response :success
  end

  test "should update parking_place" do
    patch parking_place_url(@parking_place), params: { parking_place: { description: @parking_place.description, latitude: @parking_place.latitude, longitude: @parking_place.longitude, title: @parking_place.title } }
    assert_redirected_to parking_place_url(@parking_place)
  end

  test "should destroy parking_place" do
    assert_difference('ParkingPlace.count', -1) do
      delete parking_place_url(@parking_place)
    end

    assert_redirected_to parking_places_url
  end
end
