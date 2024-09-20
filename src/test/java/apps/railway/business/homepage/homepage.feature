@ignore
Feature: Home Page
  Background:
    * def controls = locator('railway','homepage')
    * def appData = data('railway','appData')

  @methods
  Scenario:
    * def parent = parentBusiness()
    * print 'DEFAULT methods is load'
    * def featurePath = feature('railway','homepage','homepage')
    * def navigateToApp = method(featurePath, '@navigateToApp')
    * def goToLogin = method(featurePath, '@goToLogin')
    * def isWelcomeTextExists = method(featurePath, '@isWelcomeTextExists')

  @navigateToApp
  Scenario: navigate to app
    * print 'Default: Navigate to url'
    * driver appData.url

  @goToLogin
  Scenario: click login link
    * print 'Default: Click on Login link'
    * click(controls.logInLink)


  @isWelcomeTextExists
  Scenario: return true or false if WelcomeTextExist
    * print 'Default: isWelcomeTextExists'
    * def result = exists(controls.welcomeText)