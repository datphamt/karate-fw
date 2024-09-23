Feature: sample karate test script
for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:


    * def homePage = business('bachhoaxanh', 'homepage', 'ios')


    Scenario: add product to cart
      * startConfig('ios_local')
      * call homePage.searchProduct
      * delay(5000)