Feature: To demonstrate the UI Automation using Karate

  Scenario:
    Given driver "http://saferailway.somee.com/Page/HomePage.cshtml"
    And click("//span[text()='Login']")
    And input("//input[@id='username']", "ltp2@sharklasers.com")
    And input("//input[@id='password']", "ltp2")
    When click("//input[@value='login']")
    Then match driver.title == "Safe Railway"
