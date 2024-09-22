@ignore
Feature: Base Page
  Background:
    * def controls = locator('demoweb','basepage')
    * def featurePath = feature('demoweb','basepage','basepage')
    * def clickCartIcon = method(featurePath, '@clickCartIcon')
    * def getCartQuantity = method(featurePath, '@getCartQuantity')
    * def clickAcceptCookie = method(featurePath,'@clickAcceptCookie')


  @methods
  Scenario:
    * def parent = parentBusiness()
    * print 'DEFAULT methods is load'
    * def featurePath = feature('demoweb','basepage','basepage')

  @clickCartIcon
  Scenario: click on "Cart" icon
    * print 'Default: click on "Cart" icon'
    * scroll(controls.cartIcon)
    * click(controls.cartIcon)
    * delay(2000)

  @getCartQuantityNumber
  Scenario: get cart quantity number
    * print 'Default: get cart quantity'
    * def getText = text(controls.cartQuantityNumber)

  @clickAcceptCookie
  Scenario: click accept cookie
    * print 'Default: click accept cookie'
    * if( waitFor(controls.okCookieButton))  click(controls.okCookieButton)