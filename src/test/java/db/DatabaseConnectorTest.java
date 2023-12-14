package db;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.kainos.ea.db.DatabaseConnector;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.sql.Connection;
import java.sql.SQLException;
public class DatabaseConnectorTest {
    private static final String TEST_PROPERTIES_FILE = "test-db.properties";
    private static Connection conn;

    @BeforeAll
    public static void setUp() throws SQLException {
        DatabaseConnector.getConnection();
        conn = DatabaseConnector.getConnection();
    }

    @Test
    public void testConnectionNotNull() {
        assertNotNull(conn, "Connection should not be null");
    }

    @Test
    public void testConnectionIsOpen() throws SQLException {
        assertFalse(conn.isClosed(), "Connection should be open");
    }

    @AfterAll
    public static void tearDown() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }
}
