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

        Connection c = databaseConnector.getConnection();

        String query = "SELECT rt.responsibilityName FROM Responsibility rt "
                + "JOIN JobRole jr ON rt.roleID = jr.roleID WHERE jr.roleID = ?";

        PreparedStatement ps = c.prepareStatement(query);
        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        List<Responsibility> responsibilitiesList = new ArrayList<>();

        while (rs.next()) {
            Responsibility res = new Responsibility(rs.getString("responsibilityName"));
            responsibilitiesList.add(res);
        }
        return responsibilitiesList;


    }


}
