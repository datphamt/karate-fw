package testcases.bachhoaxanh;

import com.intuit.karate.junit5.Karate;

public class bachhoaxanhTest {
    @Karate.Test
    Karate add_cart() {
        String testName = System.getProperty("feature");
        return Karate.run(testName).relativeTo(getClass()).reportDir("target/karate-report-" + testName + System.currentTimeMillis());
    }
}
