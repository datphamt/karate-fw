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
    * def closePopupIfExist = method(featurePath, '@closePopupIfExist')
    * def isPopupExist = method(featurePath, '@isPopupExist')



  @navigateToShop
  Scenario: Open Shop Page
    * print 'Default: Open Shop Page'
    * click(controls.cartButton)
    * waitForUrl('/cart')

    @closePopupIfExist
    Scenario: Close Popup If Exist
      * print 'Default: Close Popup If Exist'
      * print controls.closePopupBtn
      * def isPopupExist = exists(controls.closePopupBtn) == true
      * print isPopupExist
      * if (isPopupExist) click(controls.closePopupBtn)
