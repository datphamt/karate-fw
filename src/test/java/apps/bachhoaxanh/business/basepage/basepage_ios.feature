@ignore
Feature: Base Page
  Background:
    * def controls = locator('bachhoaxanh','basepage', 'ios')
    * def appData = data('bachhoaxanh','appData')

  @methods
  Scenario:
    * def parent = parentBusiness()
    * print 'DEFAULT methods is load'
    * def featurePath = feature('bachhoaxanh','basepage','basepage_ios')
    * def searchProduct = method(featurePath, '@searchProduct')

  @searchProduct
  Scenario: Search Product
    * print 'Default: Search Product'
    * click(controls.searchSection)
    * input(controls.searchInput, appData.testData.searchProduct)