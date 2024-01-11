package org.kainos.ea.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
    private static Connection connection;

    public static Connection getConnection() throws SQLException {

        if (connection != null && !connection.isClosed()) {
            return connection;
        }

        try {
            String user = System.getenv("DB_USERNAME");
            String password = System.getenv("DB_PASSWORD");
            String host = System.getenv("DB_HOST");
            String name = System.getenv("DB_NAME");

            if (user == null || password == null || host == null) {
                throw new IllegalArgumentException(
                        "Environment variables not set");
            }

            connection = DriverManager.getConnection("jdbc:mysql://"
                    +
                    host
                    + "/"
                    + name
                    +
                    "?useSSL=false", user, password);
            return connection;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }
}
