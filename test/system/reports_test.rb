# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  def setup
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'

    click_button 'ログイン'
  end

  test 'create a report' do
    visit reports_url
    click_link '新規作成'

    fill_in 'タイトル', with: '今日の進捗'
    fill_in '内容', with: 'Reportのテストを作成しました'
    click_button '登録する'

    assert_text '日報が作成されました。'
    assert_text '今日の進捗'
    assert_text 'Reportのテストを作成しました'
  end

  test 'edit a report' do
    visit reports_url
    click_link '編集'

    fill_in 'タイトル', with: '今日の進捗（更新）'
    fill_in '内容', with: 'Bookのテストを作成しました'
    click_button '更新する'

    assert_text '日報が更新されました。'
    assert_text '今日の進捗（更新）'
    assert_text 'Bookのテストを作成しました'
  end

  test 'destroy a report' do
    visit reports_url
    accept_confirm do
      click_link '削除'
    end

    assert_text '日報が削除されました。'
  end
end
