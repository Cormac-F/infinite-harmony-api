package org.kainos.ea.db;

import org.kainos.ea.cli.Responsibility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResponsibilityDao {

    private static Connection conn;

    private DatabaseConnector databaseConnector = new DatabaseConnector();

    public List<Responsibility> getRoleResponsibilityById(int id) throws SQLException {
        String query = "SELECT rt.responsibilityName FROM Responsibility rt "
                + "JOIN JobRole jr ON rt.roleID = jr.roleID WHERE jr.roleID = ?";

        List<Responsibility> responsibilitiesList = new ArrayList<>();

        try (Connection c = databaseConnector.getConnection();
             PreparedStatement ps = c.prepareStatement(query)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Responsibility responsibility = new Responsibility();
                    responsibility.setResponsibilityName(rs.getString("responsibilityName"));
                    responsibilitiesList.add(responsibility);
                }
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return responsibilitiesList;
    }


}
