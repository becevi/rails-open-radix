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
      return "display: none;"
    else
      return "display: block;"
    end
  end

end
