@ignore
Feature: Shope Page
  Background:
    * def controls = locator('demoweb','shoppage')
    * def appData = data('demoweb','appData')

  @methods @parent=demoweb.basepage
  Scenario:
    * def parent = parentBusiness()
    * print 'DEFAULT methods is load'
    * def featurePath = feature('demoweb','shoppage','shoppage')
    * def navigateToShop = method(featurePath, '@navigateToShop')
    * def closePopupIfExist = method(featurePath, '@closePopupIfExist')
    * def isPopupExist = method(featurePath, '@isPopupExist')
    * def addProductToCart = method(featurePath, '@addProductToCart')
    * def getCartQuantity = method(featurePath, '@getCartQuantity')
    * def checkCartQuantity = method(featurePath, '@checkCartQuantity')
    * def waitForPageLoad = method(featurePath, '@waitForPageLoad')



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

  @addProductToCart
    Scenario:
      * print 'Default: Add to Cart'
      * def airpodsAddToCartBtn = format(controls.addToCartBtn, productname)
      * click(airpodsAddToCartBtn)
      * waitFor(controls.successLabel)

  @getCartQuantity
    Scenario:
      * print 'Default: Get Product Quantity'
      * def text = text(controls.cartQuatity)

  @checkCartQuantity
  Scenario:
    * print 'Default: Get Product Quantity'
    * exists(controls.cartQuatity)




    
