Feature: sample karate test script
for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:

    * startConfig('chrome_local', 'chrome1')
    * def homePage = business('demoweb', 'homepage')
    * def cartPage = business('demoweb', 'cartpage')
    * def emptyMsg = { message: 'YOUR SHOPPING CART IS EMPTY' }

  Scenario:
    * call homePage.navigateToApp
    * call homePage.navigateToCart
    * def isCartPageNav = call cartPage.isCartCheckoutNavExist
    * match isCartPageNav.result == true
    * def isEmptyCart = call cartPage.isMessageExist emptyMsg
    * match isEmptyCart.result == true
    * driver back
    * delay(5000)