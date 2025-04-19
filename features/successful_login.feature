Feature: Successful login
  In order to access my Hudl account
  As a registered user
  I want to be able to log in with valid credentials

  @sanity
  Scenario: Successful login with valid credentials
    Given I am on the MainPage
    When  I click_login_link on the MainPage
    Then  I click_hudl_login_link on the MainPage
    And   I should see the LoginPage
    When  I fill email field on LoginPage with environment variable HUDL_EMAIL
    And   I click_continue on the LoginPage
    Then  I should see the PasswordPage
    When  I fill password field on PasswordPage with environment variable HUDL_PASSWORD
    And   I click_continue on the PasswordPage
    Then  I should see the HomePage

  Scenario: Edit email during login process
    Given I am on the LoginPage
    When  I fill email field on LoginPage with the value jimi.hendrix@gmail.com
    And   I click_continue on the LoginPage
    Then  I should see the PasswordPage
    When  I click_edit_username on the PasswordPage
    Then  I should see the LoginPage
    When  I fill email field on LoginPage with environment variable HUDL_EMAIL
    And   I click_continue on the LoginPage
    Then  I should see the PasswordPage
    When  I fill password field on PasswordPage with environment variable HUDL_PASSWORD
    And   I click_continue on the PasswordPage
    Then  I should see the HomePage