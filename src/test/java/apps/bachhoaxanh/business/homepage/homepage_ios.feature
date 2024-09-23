@ignore
Feature: Home Page
  Background:
    * def controls = locator('bachhoaxanh','homepage', 'ios')
    * def appData = data('bachhoaxanh','appData')

  @methods
  Scenario:
    * def parent = parentBusiness()
    * print 'DEFAULT methods is load'
    * def featurePath = feature('bachhoaxanh','homepage','homepage_ios')
    * def searchProduct = method(featurePath, '@searchProduct')

  @searchProduct
  Scenario: Search Product
    * print 'Default: Search Product'
    * click(controls.searchInput)