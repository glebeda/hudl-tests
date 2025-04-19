class PasswordPage < BasePage

  text_field(:password, id: 'password')
  button(:continue_button, text: 'Continue')
  div(:search_bar, data_testid: 'search-bar')
  span(:error_message, id: 'error-element-password')
  link(:edit_username_link, data_link_name: 'edit-username')

  def loaded?
    password_element.check_exists
  end

  def fill_password!(password)
    self.password = password
  end

  def click_continue!
    continue_button_element.click
  end
  
  def password_field_visible?
    password_element.when_present(5).present?
  end
  
  def error_message_visible?
    error_message_element.when_present(5).present?
  end

  def error_message_text
    error_message_element.text
  end
  
  def click_edit_username!
    edit_username_link_element.click
  end
end 