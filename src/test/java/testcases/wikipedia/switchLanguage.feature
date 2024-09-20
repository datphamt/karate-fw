Feature: sample karate test script
for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * def homePage = business('wikipedia', 'homepage')
    * startConfig('chrome_local')
    #* setContext('CHROMIUM')

  Scenario: Log in
    * print homePage
    * call homePage.navigateToApp
    * call homePage.switchLanguage {language: 'ja'}

