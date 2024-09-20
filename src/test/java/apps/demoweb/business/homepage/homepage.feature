@ignore
Feature: Home Page
  Background:
    * def controls = locator('demoweb','homepage')
    * def appData = data('demoweb','appData')

  @methods
  Scenario:
    * def parent = parentBusiness()
    * print 'DEFAULT methods is load'
    * def featurePath = feature('demoweb','homepage','homepage')
    * def navigateToApp = method(featurePath, '@navigateToApp')
    * def navigateToCart = method(featurePath, '@navigateToCart')

  @navigateToApp
  Scenario: navigate to app
    * print 'Default: Open Cart Page'
    * driver appData.url

  @navigateToCart
  Scenario: Open Cart Page
    * print 'Default: Open Cart Page'
    * click(controls.cartButton)
    * waitForUrl('/cart')
