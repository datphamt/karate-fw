Feature: android test

  Background: App Preset
    * startConfig('android_local')
    # configure driver = { type: 'android', webDriverUrl:'http://localhost:4723' , webDriverPath : '/', start: false, httpConfig : { readTimeout: 120000 }}
    * def lnkNetwork = '//android.widget.TextView[@resource-id="android:id/title" and @text="Connections"]'
    * def lnkHotspot = '//android.widget.TextView[@resource-id="android:id/title" and @text="Mobile Hotspot and Tethering"]'
    * def lblWifiHotspot = '//android.widget.TextView[@resource-id="android:id/title" and @text="Mobile Hotspot"]'

  Scenario: android mobile app UI tests
    # driver { webDriverSession: { capabilities : "#(android.desiredConfig)"} }
    # driver.driver().navigate('www.google.com')
    And click(lnkNetwork)
    And click(lnkHotspot)
    Then match exists(lblWifiHotspot) == true
  # assert (optional(lblWifiHotspot).present == true)