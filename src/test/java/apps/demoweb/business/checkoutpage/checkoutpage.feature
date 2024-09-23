@ignore
Feature: checkout Page
  Background:
    * def controls = locator('demoweb','checkoutpage')
    * def appData = data('demoweb','appData')

  @methods @parent=demoweb.basepage
  Scenario:
    * def parent = parentBusiness()
    * print 'DEFAULT methods is load'
    * def featurePath = feature('demoweb','checkoutpage','checkoutpage')
    * def enterCheckoutInfo = method(featurePath, '@enterCheckoutInfo')
    * def placeOrder = method(featurePath, '@placeOrder')
    * def isSuccessfullyOrderMessageExist = method(featurePath, '@isSuccessfullyOrderMessageExist')
    * def checkReceiptInfo = method(featurePath, '@checkReceiptInfo')

    @waitForPageLoad
    Scenario: Wait for Checkoutpage load
        *print 'Default: Wait for Checkoutpage load'
        * waitFor(controls.placeOrderBtn)

    @enterCheckoutInfo
    Scenario: Enter Checkout Information
        * print 'Default: enter billing detail'
        * scroll(controls.firstNameTxt).input(firstName)
        * scroll(controls.lastNameTxt).input(lastName)

        * scroll(controls.countrySl)
        * select(controls.countrySl, country)
        * scroll(controls.addressTxt).input(address)
        * scroll(controls.cityTxt).input(city)
        * scroll(controls.phoneTxt).input(phone)
        * scroll(controls.emailTxt).input(mail)
        *  if( createAnAccount == true )  click(controls.createAccountCb)
        * scroll(controls.cashOnDeliveryRadiobox).click()

    @placeOrder
    Scenario: Place Order
        * print 'Default: Place Order'
        * scroll(controls.placeOrderBtn).click()
        * delay(1000)
        * waitFor(controls.detailsOrderLbl)
        
    @isSuccessfullyOrderMessageExist
    Scenario: is Displayed Order Successfully Message
      * print 'Default: is Successfully Order Message'
      * def result = exists(controls.thankYouMessage)
  
    @getOrderNumber
    Scenario: get order number
      * print 'Default: get total price'
      * def value = text(controls.orderNumberLbl)


  
    @getTotalPriceOrder
    Scenario: get total price
      * print 'Default: get total price'
      * def value = text(controls.totalLbl)
  
    @getPaymentMethod
    Scenario: get payment method
      * print 'Default: get payment method'
      * def value = text(controls.paymentMethodLbl)
  
    @getproduct
    Scenario: get get product
      * print 'Default: get product'
      * def value = text(controls.productName)

    @checkReceiptInfo
    Scenario: check receipt info
      * print 'Default: check receipt info'
      * def orderSuccessMessage = exists(controls.thankYouMessage)
      * match orderSuccessMessage == true
      * match text(controls.totalLbl) == totalPrice
      * match text(controls.paymentMethodLbl) == paymentMethod
      * match text(controls.productName) == productName
  
  
  






