@ignore
Feature: Home Page
  Background:
    * def controls = locator('wikipedia','homepage')
    * def appData = data('wikipedia','appData')

  @methods
  Scenario:
    * def featurePath = feature('wikipedia','homepage','homepage')
    * def navigateToApp = method(featurePath, '@navigateToApp')
    * def switchLanguage = method(featurePath, '@switchLanguage')

  @navigateToApp
  Scenario: navigate to app
    * driver appData.url

  @switchLanguage
  Scenario: switchLanguage
    * def lang = format(controls.languageLink, "", language)
    * click(lang)
