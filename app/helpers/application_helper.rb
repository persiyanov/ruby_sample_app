module ApplicationHelper
  def full_title(name = '')
    text = 'Ruby on Rails Tutorial Sample App'
    if name.empty?
      text
    else
      name + ' | ' + text
    end
  end
end
