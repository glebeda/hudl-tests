class LoginPage < BasePage

  page_url "#{BASE_URL}/login"

  text_field(:email, id: 'username')
  button(:continue_button, text: 'Continue')
  span(:error_message, id: 'error-element-username')

  def loaded?
    email_element.check_exists
  end

  def fill_email!(email)
    self.email = email
  end

  def click_continue!
    continue_button_element.click
  end

  def error_message_text
    error_message_element.text
  end
  
  def error_message_visible?
    error_message_element.when_present(5).present?
  end

end 