# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @report = reports(:one)
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#editable? when the target_user is equal to an author of the report' do
    assert(@report.editable?(@alice))
  end

  test '#editable? when the target_user is not equal to an author of the report' do
    assert_not(@report.editable?(@bob))
  end

  test 'created_on' do
    travel_to Time.zone.local(2021, 6, 16, 12, 0, 0)
    assert_equal(Date.new(2021, 6, 16), @report.created_on)
  end
end
