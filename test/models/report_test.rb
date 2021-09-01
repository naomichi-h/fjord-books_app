# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
    @report = reports(:gorukamu)
  end

  test '#editable?' do
    assert @report.editable?(@alice)
    assert_not @report.editable?(@bob)
  end

  test '#created_on' do
    assert @report.created_on
    assert_not_equal @report.created_on, @report.created_at
  end
end
