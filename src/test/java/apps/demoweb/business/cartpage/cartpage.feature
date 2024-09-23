@ignore
Feature: Home Page
  Background:
    * def controls = locator('demoweb','cartpage')
    * def appData = data('demoweb','appData')

  @methods @parent=demoweb.basepage
  Scenario:
    * def parent = parentBusiness()
    * print 'DEFAULT methods is load'
    * def featurePath = feature('demoweb','cartpage','cartpage')
    * def isMessageExist = method (featurePath,'@isMessageExist')
    * def isCartEmptyMessageExist = method (featurePath,'@isCartEmptyMessageExist')
    * def isCartCheckoutNavExist = method (featurePath,'@isCartCheckoutNavExist')
    * def returnShopPage = method (featurePath,'@returnShopPage')
    * def getProgressNodeColor = method (featurePath,'@getProgressNodeColor')
    * def proceedToCheckout = method (featurePath,'@proceedToCheckout')
    * def checkProgressNavHighlight = method (featurePath,'@checkProgressNavHighlight')


  @isMessageExist
  Scenario:
    * print 'Default: Check if message exist'
    * print controls.cartMessage
    * def emptyMessage = format(controls.cartMessage, message)
    * print emptyMessage
    * delay(10000)
    * def result = exists(emptyMessage)

  @isCartEmptyMessageExist
  Scenario:
    * print 'Default: Check if message exist'
    * print controls.cartEmptyMessage
    * delay(10000)
    * def result = exists(controls.cartEmptyMessage)

  @isCartCheckoutNavExist
  Scenario:
    * print 'Default: Check if cart checkout nav exist'
    * print controls.cartCheckoutNav
    * delay(10000)
    * def result = exists(controls.cartCheckoutNav)

  @returnShopPage
  Scenario:
    * print 'Default: Return Shope Page'
    * click(controls.returnToShopBtn)
    * delay(5000)

  @getProgressNodeColor
  Scenario:
    * print 'Default: Get Progress Node Color'
    * def cartCheckoutNavLnk = format(controls.progressNavNode, nodeName)
    * print cartCheckoutNavLnk
    * def value = script(cartCheckoutNavLnk, "function(e){ return window.getComputedStyle(e).color}")
    * print value
    * delay(5000)

  @checkProgressNavHighlight
  Scenario:
    * print 'Default: Check Progress Nav Highlight'
    * def shoppingCartNodeColor = call getProgressNodeColor { nodeName: 'Shopping cart' }
    * def checkoutNodeColor = call getProgressNodeColor { nodeName: 'Checkout' }
    * def orderStatusNodeColor = call getProgressNodeColor { nodeName: 'Order status' }
    * if (stage == 'shoppingCart') match shoppingCartNodeColor.value == 'rgb(34, 34, 34)' match checkoutNodeColor.value == 'rgb(154, 154, 154)' match orderStatusNodeColor.value == 'rgb(154, 154, 154)' 
    
  @proceedToCheckout
  Scenario:
    * print 'Default: Proceed to Checkout'
    * click(controls.processToCheckoutButton)
    * delay(10000)






