Feature: sample karate test script
for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:

    * startConfig('chrome_local', 'chrome1')
    * startConfig('chrome_local', 'chrome2')
    * def userData = data('railway', 'users')
    * def homePage = business('railway', 'homepage')
    * def loginPage = business('railway', 'loginpage')

  Scenario: Log in
    * call homePage.navigateToApp
    * call homePage.goToLogin
    * switchDriver('chrome1')
    * driver 'https://www.google.com.vn'
    * delay(5000)
    * switchDriver('chrome2')
    * call loginPage.login userData.validUser
    * delay(5000)
    * switchDriver('chrome1')
    * driver 'https://www.thegioididong.com'
    * delay(5000)
    * switchDriver('chrome2')
    * def isWelcomeTextExisted = call homePage.isWelcomeTextExists
    * delay(5000)
    * match isWelcomeTextExisted.result == true