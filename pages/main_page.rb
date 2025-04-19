class MainPage < BasePage
  
    page_url BASE_URL

    link(:login_link, data_qa_id: 'login-select')
    link(:hudl_login_link, data_qa_id: 'login-hudl')

    def loaded?
      login_link_element.check_exists
    end

    def click_login_link!
      login_link_element.click
    end

    def click_hudl_login_link!
      hudl_login_link_element.click
    end
    
end
  
  