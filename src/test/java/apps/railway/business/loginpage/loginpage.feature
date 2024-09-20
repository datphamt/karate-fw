@ignore
Feature: Login Page
  Background:
    * def controls = locator('railway','loginpage')

  @methods
  Scenario:
    * def parent = parentBusiness()
    * def featurePath = feature('railway', 'loginpage', 'loginpage')
    * def login = method(featurePath, '@login')

  @login
  Scenario: login to app
    * input(controls.usernameTextbox, username)
    * input(controls.passwordTextbox, password)
    * click(controls.loginButton)