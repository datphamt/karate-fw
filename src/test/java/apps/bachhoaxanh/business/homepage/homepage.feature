@ignore
Feature: Home Page
  Background:
    * def controls = locator('bachhoaxanh','homepage_ios')
    * def appData = data('bachhoaxanh','appData')

  @methods @parent=bachhoaxanh.basepage
  Scenario:
    * def parent = parentBusiness()
    * print 'DEFAULT methods is load'
    * def featurePath = feature('bachhoaxanh','homepage','homepage')
    * def searchProduct = method(featurePath, '@searchProduct')

  @searchProduct
  Scenario: Search Product
    * print 'Default: Search Product'
    * call click(controls.searchInput)