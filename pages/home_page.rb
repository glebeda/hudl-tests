class HomePage < BasePage
  
    div(:explore_header, id: 'explore-header')

    page_url "#{BASE_URL}/home"

    def loaded?
      explore_header_element.check_exists
    end

end
  
  