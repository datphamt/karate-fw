Feature: sample karate test script
for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:

    * startConfig('chrome_local')
    * def userData = data('railway', 'users')
    * def homePage = business('railway', 'homepage')
    * def loginPage = business('railway', 'loginpage')

  Scenario: Log in
    * call homePage.navigateToApp
    * call homePage.goToLogin
    * call loginPage.login userData.validUser
    * def isWelcomeTextExisted = call homePage.isWelcomeTextExists
    * match isWelcomeTextExisted.result == true