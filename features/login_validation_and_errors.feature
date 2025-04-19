@security
Feature: Login validation and error handling
  In order to prevent bad data and attacks
  As a security conscious application
  I want to reject invalid input on the login forms

  Background:
    Given I am on the LoginPage

  Scenario: Invalid email format
    When  I fill email field on LoginPage with the value not-an-email
    And   I click_continue on the LoginPage
    Then  I should see the error_message on the LoginPage
    And   I should see Enter a valid email. text in error_message on the LoginPage
    
  Scenario Outline: Incorrect username or password
    When  I fill email field on LoginPage with <email_source>
    And   I click_continue on the LoginPage
    Then  I should see the PasswordPage
    When  I fill password field on PasswordPage with the value 1234567
    And   I click_continue on the PasswordPage
    Then  I should see the error_message on the PasswordPage
    And   I should see Incorrect username or password. text in error_message on the PasswordPage
    
    Examples:
      | email_source                      |
      | the value jimi.hendrix@gmail.com  |
      | environment variable HUDL_EMAIL   |

  Scenario Outline: Injection attempt in email field
    When  I fill email field on LoginPage with the value <email_value>
    And   I click_continue on the LoginPage
    Then  I should see the error_message on the LoginPage
    And   I should see Enter a valid email. text in error_message on the LoginPage

    Examples:
      | email_value                     |
      | ' OR '1'='1                     |
      | <script>alert('xss')</script>   |    
