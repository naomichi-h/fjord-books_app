# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')
    report = Report.create!(user: me, title: 'ゴールデンカムイ読んだ感想', content: 'いろんな意味でヤバイ漫画')

    assert report.editable?(me)
    assert_not report.editable?(she)
  end

  test '#created_on' do
    me = User.create!(email: 'me@example.com', password: 'password')
    report = Report.create!(user: me, title: 'ゴールデンカムイ読んだ感想', content: 'いろんな意味でヤバイ漫画')

    assert report.created_on
    assert_not_equal report.created_on, report.created_at
  end
end
