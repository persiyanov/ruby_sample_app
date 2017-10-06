require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'full title helper test' do
    assert_equal full_title, 'Ruby on Rails Tutorial Sample App'
    assert_equal full_title('Contacts'), 'Contacts | Ruby on Rails Tutorial Sample App'
  end
end