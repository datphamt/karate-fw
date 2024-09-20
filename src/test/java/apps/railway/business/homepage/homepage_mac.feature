@ignore
Feature: Home Page
  Background:
    * def controls = locator('railway','homepage','mac')
    * def appData = data('railway','appData', 'mac')

  @methods @parent=railway.homepage_win
  Scenario:
    * def parent = parentBusiness()
    * print 'MAC methods is load'
    * def featurePath = feature('railway','homepage','homepage_mac')
    * def isWelcomeTextExists = method(featurePath, '@isWelcomeTextExists')
    * def isWarningTextExists = method(featurePath, '@isWarningTextExists')

  @isWelcomeTextExists
  Scenario: return true or false if WelcomeTextExist
    * print 'MAC: isWelcomeTextExists'
    * def result = exists(controls.welcomeText)

  @isWarningTextExists
  Scenario: return true or false if WarningTextExist
    * print 'MAC: isWarningTextExists'
    * def result = exists(controls.warningText)