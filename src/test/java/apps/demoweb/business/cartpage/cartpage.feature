@ignore
Feature: Home Page
  Background:
    * def controls = locator('demoweb','cartpage')
    * def appData = data('demoweb','appData')

  @methods
  Scenario:
    * def parent = parentBusiness()
    * print 'DEFAULT methods is load'
    * def featurePath = feature('demoweb','cartpage','cartpage')
    * def isMessageExist = method (featurePath,'@isMessageExist')
    * def isCartEmptyMessageExist = method (featurePath,'@isCartEmptyMessageExist')
    * def isCartCheckoutNavExist = method (featurePath,'@isCartCheckoutNavExist')
    * def returnShopPage = method (featurePath,'@returnShopPage')


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





