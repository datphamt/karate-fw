Feature: sample karate test script
for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * startConfig(2)
    * def userData = data('railway', 'users')
    * def homePage = business('railway', 'homepage')
    * def loginPage = business('railway', 'loginpage')

  Scenario: Log in
    * call homePage.navigateToApp
    * call homePage.goToLogin
    * call loginPage.login userData.validUser
    * delay(5000)
    * def isWelcomeTextExisted = call homePage.isWelcomeTextExists
    * match isWelcomeTextExisted.result == false
    * def isWarningTextExisted = call homePage.isWarningTextExists
    * match isWarningTextExisted.result == false