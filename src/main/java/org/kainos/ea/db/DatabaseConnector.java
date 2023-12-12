package org.kainos.ea.db;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseConnector {
    private static Connection connection;

    public static Connection getConnection() throws SQLException {
        String user;
        String password;
        String host;
        String name;

        if (connection != null && !connection.isClosed()) {
            return connection;
        }

        try (FileInputStream propsStream = new FileInputStream("db.properties")) {

            Properties props = new Properties();
            props.load(propsStream);

            user = props.getProperty("user");
            password = props.getProperty("password");
            host = props.getProperty("host");
            name = props.getProperty("name");

            if (user == null || password == null || host == null) {
                throw new IllegalArgumentException("Properties file must exist "
                        + "and must contain user, password, name, and host properties");
            }

            connection = DriverManager.getConnection("jdbc:mysql://"
                    +
                    host
                    + "/"
                    + name
                    + "?useSSL=false", user, password);
            return connection;

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }
}
