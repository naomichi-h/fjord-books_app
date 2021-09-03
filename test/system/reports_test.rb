# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end

  test 'visiting the index' do
    visit reports_path
    assert_selector 'h1', exact_text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'ザ・ファブル読んだ感想'
    fill_in '内容', with: '「祈るのではなく、イメージしろ」というセリフが気に入った。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'ザ・ファブル読んだ感想'
    assert_text '「祈るのではなく、イメージしろ」というセリフが気に入った。'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: 'ザ・ファブル読んだ感想(追記)'
    fill_in '内容', with: '「祈るのではなく、イメージしろ」というセリフが気に入った。「恥辱に塗れて人は成長する」と言うのも一理あると思った。'

    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text 'ザ・ファブル読んだ感想(追記)'
    assert_text '「祈るのではなく、イメージしろ」というセリフが気に入った。「恥辱に塗れて人は成長する」と言うのも一理あると思った。'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '削除されました。'
  end
end
