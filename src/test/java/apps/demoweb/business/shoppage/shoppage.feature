@ignore
Feature: Shope Page
  Background:
    * def controls = locator('demoweb','shoppage')
    * def appData = data('demoweb','appData')

  @methods
  Scenario:
    * def parent = parentBusiness()
    * print 'DEFAULT methods is load'
    * def featurePath = feature('demoweb','shoppage','shoppage')
    * def navigateToShop = method(featurePath, '@navigateToShop')



  @navigateToShop
  Scenario: Open Shop Page
    * print 'Default: Open Shop Page'
    * click(controls.cartButton)
    * waitForUrl('/cart')

    @closePopupIfExist
    Scenario: Close Popup If Exist
      * print 'Default: Close Popup If Exist'
      * def isPopupExist = call isPopupExist
      * if (isPopupExist.result)
      *   click(controls.closePopupButton)
      *   waitForElementNotPresent(controls.closePopupButton)
      * end