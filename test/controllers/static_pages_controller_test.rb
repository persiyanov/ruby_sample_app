require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @basic_title = 'Ruby on Rails Tutorial Sample App'
  end

  test 'should get root' do
    get root_path
    assert_response :success
    
  end

  test 'should get home' do
    get home_path
    assert_response :success
    assert_select 'title', "Home | #{@basic_title}"
  end

  test 'should get help' do
    get help_path
    assert_response :success
    assert_select 'title', "Help | #{@basic_title}"
  end

  test 'should get about' do
    get about_path
    assert_response :success
    assert_select 'title', "About | #{@basic_title}"
  end

  test 'should get contacts' do
    get contacts_path
    assert_response :success
    assert_select 'title', "Contacts | #{@basic_title}"
  end
end
