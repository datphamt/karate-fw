@ignore
Feature: Home Page
  Background:
    * def controls = locator('railway','homepage', 'win')
    * def appData = data('railway','appData', 'win')

  @methods @parent=railway.homepage
  Scenario:
    * def parent = parentBusiness()
    * print 'WIN methods is load'
    * def featurePath = feature('railway','homepage','homepage_win')
    * def goToLogin = method(featurePath, '@goToLogin')

  @goToLogin
  Scenario: click login link
    * print 'WIN: Click on Login link'
    * click(controls.logInLink)
