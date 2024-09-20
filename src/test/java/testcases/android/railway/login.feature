Feature: sample karate test script
for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * def userData = data('railway', 'users')
    * def homePage = business('railway', 'homepage')
    * def loginPage = business('railway', 'loginpage')
    * startConfig('android_chrome_local')
    * setContext('CHROMIUM')

  @setup
  Scenario:
    * def kittens = data('railway', 'userDD')

  Scenario Outline: cat name: ${username}

    * call homePage.navigateToApp
    * call homePage.goToLogin
    * input("//input[@id='username']", username)
    * input("//input[@id='password']", [password, Key.ENTER])
    * def isWelcomeTextExisted = call homePage.isWelcomeTextExists
    * match isWelcomeTextExisted.result == true

    Examples:
      | karate.setup().kittens |



  @ignore
  Scenario: Log in
    * call homePage.navigateToApp
    * call homePage.goToLogin
    * input("//input[@id='username']", "demo@sharklasers.com")
    * input("//input[@id='password']", ["demo1234", Key.ENTER])
    #* driver.click("//input[@value='login']")
    #* loginPage.login(userData.validUser)
    * def isWelcomeTextExisted = call homePage.isWelcomeTextExists
    * match isWelcomeTextExisted.result == true