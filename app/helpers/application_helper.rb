module ApplicationHelper

  def current_class?(test_path)
    if request.path == test_path
      return 'nav-link active' 
    else
      return 'nav-link'
    end
  end

  def is_home?(test_path)
    if request.path == test_path
      return "display: block;"
    else
      return "display: none;"
    end
  end

end
