package testcases.demoweb;

import com.intuit.karate.junit5.Karate;

public class demowebTest {
    @Karate.Test
    Karate orderShop() {
        //String testName = System.getProperty("feature");
        return Karate.run("anonymous_order.feature").relativeTo(getClass());
        //reportDir("target/karate-report-" + testName + System.currentTimeMillis());
    }
}
