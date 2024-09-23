function f() {
    var uuid = java.util.UUID.randomUUID(); // Generate a unique ID for each instance
    var chromeDir = 'target/chrome_' + uuid;

    return {
        chrome: {
            settings: { type: 'chrome', platformName: 'windows', addOptions: ['--incognito', '--start-maximized'] }
        },
        chrome_local: {
            settings: { type: 'chrome', platformName: 'win', addOptions: ['--incognito', '--start-maximized'] }
        },
        mac_chrome_local: {
            settings: { type: 'chrome', platformName: 'mac', addOptions: ['--incognito', '--start-maximized'] }
        },
        chromedriver_multi: {
                settings: {
                    start: true,
                    type: 'chromedriver',
                    showDriverLog: true,
                    executable: 'C:\\Users\\duong.luong\\Documents\\drivers\\127\\chromedriver.exe'
                }
        },
        msedge_local: {
            settings: { type: 'msedgedriver', webDriverSession: { capabilities: { browserName: 'edge' } } }
        },
        firefox_local: {
            settings: { type: 'geckodriver', webDriverSession: { capabilities: { "alwaysMatch":{"browserName":"firefox", "moz:firefoxOptions" : {"binary":"C:\\Program Files\\Mozilla Firefox\\firefox.exe"}}} } }
        },
        safari_local: {
            settings: { type: 'safaridriver', webDriverSession: { capabilities: {browserName: 'safari'} } }
        },
        android_local: {
            settings: { type: 'android',
                webDriverUrl:'http://localhost:4723',
                webDriverPath : '/',
                start: true,
                httpConfig : { readTimeout: 160000 },
                webDriverSession: { capabilities:
                    {
                    "alwaysMatch": {
                        "platformName": "Android",
                        //"browserName": "Chrome",
                        //"appium:chromedriverExecutable": "C:\\Users\\duong.luong\\Documents\\drivers\\117\\chromedriver.exe",
                        //"appium:platformVersion": "13.0",
                        "appium:deviceName": "R5CTA2TV7NE",
                        "appium:automationName": "UiAutomator2",
                        "appium:appPackage": "com.android.settings",
                        "appium:appActivity": "com.android.settings.Settings",
                        "appium:connectHardwareKeyboard": true,
                        "appium:newCommandTimeout": 300,
                        "appium:noReset": false
                    },
                    "firstMatch": [{}]
                    }
                }
            }
        },
        android_chrome_local: {
            settings: {
                type: 'android',
                //webDriverUrl:'http://localhost:4723',
                webDriverPath : '/',
                start: true,
                httpConfig : { readTimeout: 160000 },
                webDriverSession: {
                    capabilities: {
                        "alwaysMatch": {
                        "platformName": "Android",
                        "browserName": "Chrome",
                        "appium:chromedriverExecutable": "C:\\Users\\duong.luong\\Documents\\drivers\\127\\chromedriver.exe",
                        //"appium:platformVersion": "13.0",
                        "appium:deviceName": "R5CTA2TV7NE",
                        "appium:automationName": "UiAutomator2",
                        //"appium:appPackage": "com.android.settings",
                        //"appium:appActivity": "com.android.settings.Settings",
                        "appium:connectHardwareKeyboard": true,
                        "appium:newCommandTimeout": 300,
                        "appium:noReset": false
                        },
                        "firstMatch": [{}]
                    }
                }
            }
        },
        android_bhx_local: {
            settings: { type: 'android',
                //webDriverUrl:'http://localhost:4723',
                //webDriverPath : '/',
                start: true,
                httpConfig : { readTimeout: 160000 },
                webDriverSession: { capabilities:
                    {
                    "alwaysMatch": {
                        "platformName": "Android",
                        "appium:deviceName": "R5CTA2TV7NE",
                        "appium:automationName": "UiAutomator2",
                        "appium:appPackage": "com.bachhoaxanh",
                        "appium:appActivity": "com.bachhoaxanh.MainActivity",
                        "appium:connectHardwareKeyboard": true,
                        "appium:newCommandTimeout": 300,
                        "appium:noReset": false
                    },
                    "firstMatch": [{}]
                    }
                }
            }
        },
        ios_local: {
            settings: {
                type: 'ios',
                webDriverUrl:'http://172.17.31.71:4726/',
                webDriverPath : '/wd/hub',
                start: false,
                platformName: "ios",
                httpConfig : { readTimeout: 160000 },
                webDriverSession: {
                    capabilities: {
                        "alwaysMatch": {
                            "platformName": "iOS",
                            "appium:deviceName": "iPhone",
                            //"appium:platformVersion": "17.2.1",
                            "appium:udid": "00008020-000D306A01B9002E",
                            "appium:automationName": "XCUITest",
                            "appium:bundleId": "com.bachhoaxanh",
                            "appium:autoDismissAlerts": true,
                            "appium:allowInvisibleElements": true
                        },
                        "firstMatch": [{}]
                    }
                }
            }
        },
        ios_appstore_local: {
             settings: {
               type: 'ios',
               webDriverUrl:'http://127.0.0.1:4723/',
               webDriverPath : '/',
               start: false,
               platformName: "ios",
               httpConfig : { readTimeout: 160000 },
               webDriverSession: {
               capabilities: {
                                "alwaysMatch": {
                                    "platformName": "iOS",
                                    "appium:deviceName": "iPhone",
                                    //"appium:platformVersion": "17.2.1",
                                    "appium:udid": "00008110-000105E03491801E",
                                    "appium:automationName": "XCUITest",
                                    "appium:bundleId": "com.apple.AppStore",
                                    "appium:autoDismissAlerts": true,
                                    "appium:allowInvisibleElements": true
                                },
                                "firstMatch": [{}]
                            }
                        }
             }
        },
        android_chPlay_local: {
            settings: { type: 'android',
                        //webDriverUrl:'http://127.0.0.1:4723/wd/hub',
                        //webDriverPath : '/',
                        start: true,
                        httpConfig : { readTimeout: 160000 },
                        webDriverSession: { capabilities:
                            {
                            "alwaysMatch": {
                                "platformName": "Android",
                                //"appium:deviceName": "Pixel 7",
                                "appium:automationName": "UiAutomator2",
                                "appium:appPackage": "com.bachhoaxanh",
                                "appium:appActivity": ".MainActivity",
                                "appium:connectHardwareKeyboard": true,
                                "appium:newCommandTimeout": 300,
                                "appium:noReset": false
                            },
                            "firstMatch": [{}]
                            }
                        }
            }
        }
    }
}