require 'test_helper'

class ChallengeActivitiesControllerTest < ActionController::TestCase
  setup do
    @challenge_activity = challenge_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:challenge_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create challenge_activity" do
    assert_difference('ChallengeActivity.count') do
      post :create, challenge_activity: { activity_id: @challenge_activity.activity_id, challenge_id: @challenge_activity.challenge_id, number_threshold: @challenge_activity.number_threshold, points_per_threshold: @challenge_activity.points_per_threshold, threshold_kind: @challenge_activity.threshold_kind, threshold_value: @challenge_activity.threshold_value }
    end

    assert_redirected_to challenge_activity_path(assigns(:challenge_activity))
  end

  test "should show challenge_activity" do
    get :show, id: @challenge_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @challenge_activity
    assert_response :success
  end

  test "should update challenge_activity" do
    patch :update, id: @challenge_activity, challenge_activity: { activity_id: @challenge_activity.activity_id, challenge_id: @challenge_activity.challenge_id, number_threshold: @challenge_activity.number_threshold, points_per_threshold: @challenge_activity.points_per_threshold, threshold_kind: @challenge_activity.threshold_kind, threshold_value: @challenge_activity.threshold_value }
    assert_redirected_to challenge_activity_path(assigns(:challenge_activity))
  end

  test "should destroy challenge_activity" do
    assert_difference('ChallengeActivity.count', -1) do
      delete :destroy, id: @challenge_activity
    end

    assert_redirected_to challenge_activities_path
  end
end
