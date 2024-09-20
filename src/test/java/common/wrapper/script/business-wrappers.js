function() {
    return {
        // Construct the path to a feature file using the application, name, and feature parameters.
        feature: function(app, name, feature) {
            return resource.featurePath(app, name, feature)
        },

        // Read and return the contents of a feature file given its path and name.
        method: function(feature, name) {
            return karate.read(feature + name)
        },

        // Call a specific business logic feature file based on the application and name.
        business: function(app, name, platform = "") {
            var platformData = karate.call(resource.businessPath(app, name, platform))
            return getMergedBusiness(platformData)
        },

        // Read and return the locator file contents based on the application and name.
        locator: function(app, name, platform = "") {
            var defaultPath = resource.defaultLocatorPath(app, name, name)
            var platformPath = resource.locatorPath(app, name, platform)
            if (defaultPath != platformPath) {
                var defaultData = karate.read(defaultPath)
                var platformData = karate.read(platformPath)
                return karate.merge(defaultData, platformData)
            }
            else {
                return karate.read(defaultPath)
            }
        },

        // Read and return the data file contents based on the application and name.
        data: function(app, name, platform = "", env = "") {
            var defaultPath = resource.defaultDataPath(app, name)
            var dataPath = resource.dataPath(app, name, platform, env)
            var nonMergedData;
            if(dataPath != defaultPath) {
                nonMergedData = karate.read(dataPath)
            }
            else {
                nonMergedData = karate.read(defaultPath)
            }
            return nonMergedData
        },

        parentBusiness: function() {
            return driverUtils.getTagValue('parent')
        },

        // Get merged business methods from inheritance tree
        getMergedBusiness: function(data) {
            if (data.parent) {
                var parentParts = data.parent.split('.')
                var parentApp = parentParts[0]
                var parentName = parentParts[1]
                var parentFeature = parentParts[1]
                if (parentName.includes('_')) {
                    parentName = parentName.split('_')[0]
                }
                var parentData = karate.call(resource.defaultBusinessPath(parentApp, parentName, parentFeature))
                var mergedBusiness = getMergedBusiness(parentData)
                return karate.merge(mergedBusiness, data)
            }
            return data
        },

        // New method to run terminal commands using Java
        runCommand: function(command) {
            var processBuilder = new Java.type('java.lang.ProcessBuilder')();
            processBuilder.command(command.split(' '));  // Split the command into arguments
            var process = processBuilder.start();
            process.waitFor();

            var inputStream = process.getInputStream();
            var reader = new Java.type('java.io.BufferedReader')(new Java.type('java.io.InputStreamReader')(inputStream));
            var line;
            while ((line = reader.readLine()) != null) {
                print(line);
            }
            var errorStream = process.getErrorStream();
            var errorReader = new Java.type('java.io.BufferedReader')(new Java.type('java.io.InputStreamReader')(errorStream));
            while ((line = errorReader.readLine()) != null) {
                print("ERROR: " + line);
            }
            return process.exitValue();
        },

        // Generate a random string with provided length with the first uppercase letter and the lowercase letters others
        getCurrentDateAndFormat: function() {
            var date = new Date();
            const months = ['January', 'February', 'March', 'April', 'May', 'June','July', 'August', 'September', 'October', 'November', 'December'];
            const day = date.getDate();
            const month = months[date.getMonth()];
            const year = date.getFullYear();
            return `${month} ${day}, ${year}`;
        },

        isNumber: function(value) {
            return !isNaN(value) && typeof value === 'number';
        },

        getCurrentDate: function() {
            var date = new Date();
            var day = date.getDate();
            return day < 10 ? '0' + day : day.toString();
        },

        getCurrentMonth: function() {
            var date = new Date();
            var month = date.getMonth() + 1; // getMonth() returns 0-11, so add 1
            return month < 10 ? '0' + month : month.toString();
        },

        getCurrentYear: function() {
            var date = new Date();
            return date.getFullYear();
        },

        getRandomFromArray: function(items) {
            return items[Math.floor(Math.random() * items.length)];
        },

        getRandomNumber: function(min, max) {
            return Math.floor(Math.random() * (max - min) ) + min;
        },

        generateRandomString: function(length) {
            if (length < 1) {
                throw new Error("Length must be at least 1.");
            }

            // Helper function to get a random integer between min and max (inclusive)
            function getRandomInt(min, max) {
                return Math.floor(Math.random() * (max - min + 1)) + min;
            }

            // Generate the first character (uppercase letter)
            const firstChar = String.fromCharCode(getRandomInt(65, 90)); // ASCII codes for 'A' to 'Z'

            // Generate the remaining characters (lowercase letters)
            const remainingChars = Array.from({ length: length - 1 }, () => {
                return String.fromCharCode(getRandomInt(97, 122)); // ASCII codes for 'a' to 'z'
            }).join('');

            // Concatenate the first character with the remaining characters
            return firstChar + remainingChars;
        }
    }
}