package org.kainos.ea.db;

import org.kainos.ea.cli.Job;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class JobDao {
    private static Connection conn;
    private DatabaseConnector databaseConnector = new DatabaseConnector();

    public Job getJobSpecById(int id) throws SQLException {
        Connection c = databaseConnector.getConnection();

        PreparedStatement ps = null;

        ResultSet rs = null;


        String query = "SELECT roleID, roleName, specSummary, sharepointLink FROM JobRole WHERE roleID = ?";
        ps = c.prepareStatement(query);
        ps.setInt(1, id);

        rs = ps.executeQuery();

        while (rs.next()) {
            return new Job(
                    rs.getInt("roleID"),
                    rs.getString("roleName"),
                    rs.getString("specSummary"),
                    rs.getString("sharepointLink")
            );
        }

        return null;
    }

    public List<Job> getAllJobs() throws SQLException {
        Connection c = databaseConnector.getConnection();

        Statement st = c.createStatement();

        ResultSet rs = st.executeQuery("SELECT roleID, roleName FROM JobRole");

        List<Job> jobList = new ArrayList<>();

        while (rs.next()) {
            Job job = new Job(
                    rs.getInt("roleID"),
                    rs.getString("roleName")
            );
            jobList.add(job);
        }

        return jobList;
    }
}
