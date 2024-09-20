package testcases.railway.login;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ParallelTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:testcases/railway")
                .tags("~@skip")
                .parallel(4);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
