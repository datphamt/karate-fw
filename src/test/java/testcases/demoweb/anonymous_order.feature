Feature: sample karate test script
for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:

    * startConfig('chrome_local', 'chrome1')
    * def homePage = business('demoweb', 'homepage')
    * def cartPage = business('demoweb', 'cartpage')
    * def shopPage = business('demoweb', 'shoppage')
    * def checkoutPage = business('demoweb', 'checkoutpage')
    * def emptyMsg = { message: 'YOUR SHOPPING CART IS EMPTY' }
    * def airpods = { productname: 'AirPods' }
    * def checkoutData = { firstName: "test1", lastName: "agest", country: "VN", address: "Steet 1111", city: "HCM", phone: "0987654321", mail: "tester1@mail.com", createAnAccount: false , totalPrice: "$290.00", paymentMethod: "Cash on delivery", productName: "AirPods"} 
  Scenario:
    * call homePage.navigateToApp
    * print homePage
    * print shopPage
    * print cartPage
    * call homePage.clickCartIcon
#    * def isCartPageNav = call cartPage.isCartCheckoutNavExist
#    * match isCartPageNav.result == true
#    * def isEmptyCart = call cartPage.isMessageExist emptyMsg
#    * match isEmptyCart.result == true
    * call cartPage.returnShopPage
    * call shopPage.closePopupIfExist
    * call shopPage.addProductToCart airpods
    * print text(shopPage.controls.cartQuatity)
    * def cartQuatity = call shopPage.getCartQuantity
    * print cartQuatity.text
    * assert Number(cartQuatity.text) >= 1
    * call homePage.clickCartIcon
    * def shoppingCartNodeColor = call cartPage.getProgressNodeColor { nodeName: 'Shopping cart' }
    * def checkoutNodeColor = call cartPage.getProgressNodeColor { nodeName: 'Checkout' }
    * def orderStatusNodeColor = call cartPage.getProgressNodeColor { nodeName: 'Order status' }
    * match shoppingCartNodeColor.value == 'rgb(34, 34, 34)'
    * match checkoutNodeColor.value == 'rgb(154, 154, 154)'
    * match orderStatusNodeColor.value == 'rgb(154, 154, 154)'
    * call cartPage.clickAcceptCookie
    * call cartPage.proceedToCheckout
    * def shoppingCartNodeColor = call cartPage.getProgressNodeColor { nodeName: 'Shopping cart' }
    * def checkoutNodeColor = call cartPage.getProgressNodeColor { nodeName: 'Checkout' }
    * def orderStatusNodeColor = call cartPage.getProgressNodeColor { nodeName: 'Order status' }
    * match shoppingCartNodeColor.value == 'rgb(34, 34, 34)'
    * match checkoutNodeColor.value == 'rgb(34, 34, 34)'
    * match orderStatusNodeColor.value == 'rgb(154, 154, 154)'
    * call checkoutPage.enterCheckoutInfo checkoutData
    * call checkoutPage.placeOrder 
    * call checkoutPage.checkReceiptInfo checkoutData
    * print 'done'
    * delay(20000)

