require 'test_helper'

class ActivityTracksControllerTest < ActionController::TestCase
  setup do
    @activity_track = activity_tracks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_tracks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_track" do
    assert_difference('ActivityTrack.count') do
      post :create, activity_track: { tracked_on: @activity_track.tracked_on }
    end

    assert_redirected_to activity_track_path(assigns(:activity_track))
  end

  test "should show activity_track" do
    get :show, id: @activity_track
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_track
    assert_response :success
  end

  test "should update activity_track" do
    patch :update, id: @activity_track, activity_track: { tracked_on: @activity_track.tracked_on }
    assert_redirected_to activity_track_path(assigns(:activity_track))
  end

  test "should destroy activity_track" do
    assert_difference('ActivityTrack.count', -1) do
      delete :destroy, id: @activity_track
    end

    assert_redirected_to activity_tracks_path
  end
end
