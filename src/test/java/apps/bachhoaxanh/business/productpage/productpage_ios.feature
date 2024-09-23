@ignore
Feature: Product Page
  Background:
    * def controls = locator('bachhoaxanh','productpage', 'ios')
    * def appData = data('bachhoaxanh','appData')

  @methods
  Scenario:
    * def parent = parentBusiness()
    * print 'DEFAULT methods is load'
    * def featurePath = feature('bachhoaxanh','productpage','productpage_ios')
    * def selectProductOption = method (featurePath, '@selectProductOption')


  @selectProductOption
  Scenario: select Product option
    * print 'Default: select Product option'
    * def selectedProductOption = format(controls.productOptionCb, productOption)
    * click(selectedProductOption)

    @addProductToCart
    Scenario: add product to cart
        * print 'Defaut: add product to cart'
        * click(controls.addToCartBtn)



  
    