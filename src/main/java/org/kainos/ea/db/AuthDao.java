package org.kainos.ea.db;

import org.apache.commons.lang3.time.DateUtils;
import org.kainos.ea.cli.Login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.UUID;

public class AuthDao {
    private DatabaseConnector databaseConnector = new DatabaseConnector();
    private final int hours = 72;
    private final int param = 3;


    public boolean validLogin(Login login) {
        try (Connection c = databaseConnector.getConnection()) {
            String getLogin = "SELECT Password FROM `User` WHERE Username = ? ";
            PreparedStatement st = c.prepareStatement(getLogin, Statement.RETURN_GENERATED_KEYS);

            st.setString(1, login.getUsername());

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return rs.getString("password").equals(login.getPassword());
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return false;
    }

    public String generateToken(String username) throws SQLException {
        String token = UUID.randomUUID().toString();
        Date expiry = DateUtils.addHours(new Date(), hours);

        Connection c = databaseConnector.getConnection();

        String insertStatement = "INSERT INTO Token (Username, Token, Expiry) VALUES (?, ?, ?);";

        PreparedStatement st = c.prepareStatement(insertStatement);

        st.setString(1, username);
        st.setString(2, token);
        st.setTimestamp(param, new java.sql.Timestamp(expiry.getTime()));

        st.executeUpdate();

       return token;
    }
}
