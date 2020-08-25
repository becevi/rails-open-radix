module ApplicationHelper

  def current_class?(test_path)
    if request.path == test_path
      return 'nav-link active' 
    else
      return 'nav-link'
    end
  end

end
