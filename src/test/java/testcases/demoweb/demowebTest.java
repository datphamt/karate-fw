package testcases.demoweb;

import com.intuit.karate.junit5.Karate;

public class demowebTest {
    @Karate.Test
    Karate testLogin() {
        String testName = System.getProperty("feature");
        return Karate.run(testName).relativeTo(getClass()).reportDir("target/karate-report-" + testName + System.currentTimeMillis());
    }
}
