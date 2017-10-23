require 'test_helper'

class TrainSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @train_schedule = train_schedules(:one)
  end

  test "should get index" do
    get train_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_train_schedule_url
    assert_response :success
  end

  test "should create train_schedule" do
    assert_difference('TrainSchedule.count') do
      post train_schedules_url, params: { train_schedule: { arrives: @train_schedule.arrives, arrives_time: @train_schedule.arrives_time, departs: @train_schedule.departs, departs_time: @train_schedule.departs_time, train_id: @train_schedule.train_id } }
    end

    assert_redirected_to train_schedule_url(TrainSchedule.last)
  end

  test "should show train_schedule" do
    get train_schedule_url(@train_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_train_schedule_url(@train_schedule)
    assert_response :success
  end

  test "should update train_schedule" do
    patch train_schedule_url(@train_schedule), params: { train_schedule: { arrives: @train_schedule.arrives, arrives_time: @train_schedule.arrives_time, departs: @train_schedule.departs, departs_time: @train_schedule.departs_time, train_id: @train_schedule.train_id } }
    assert_redirected_to train_schedule_url(@train_schedule)
  end

  test "should destroy train_schedule" do
    assert_difference('TrainSchedule.count', -1) do
      delete train_schedule_url(@train_schedule)
    end

    assert_redirected_to train_schedules_url
  end
end
