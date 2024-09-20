function() {
    var driverString = karate.properties['karate.driverConfigs'] || ''
    var driverConfigs = driverString.split(',') || ['chrome_local']
    var env = karate.properties['karate.env'] || ''
    print('environment:' + env)
    print('driver configs:' + driverConfigs)

    // Read the resources configuration from the specified path and invoke it.
    var resource = karate.read('classpath:/resources/config/resources.js')()

    // Import the Java class 'DriverUtils' from the 'common' package for managing WebDriver settings and actions.
    var driverUtils = Java.type('common.wrapper.DriverUtils')

    // Set the WebDriver settings by reading the configuration from a specified path.
    driverUtils.setDriverSettings(karate.read(paths.driverSettingsPath)())
    driverUtils.setCurrentDriverConfigs(driverConfigs)

    // Store the 'resource' and 'driverUtils' objects in the Karate context, making them accessible throughout the tests.
    karate.set('resource', resource)
    karate.set('driverUtils', driverUtils)

    // Read javascript wrapper methods
    var driverWrappers = karate.read('classpath:/common/wrapper/script/driver-wrappers.js')()
    var businessWrappers = karate.read('classpath:/common/wrapper/script/business-wrappers.js')()
    var stringWrappers = karate.read('classpath:/common/wrapper/script/string-wrappers.js')()

    // Return all javascript wrapper methods
    return karate.merge(
        driverWrappers,
        businessWrappers,
        stringWrappers
    )
}