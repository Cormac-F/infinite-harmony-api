package org.kainos.ea.db;

import org.kainos.ea.cli.Job;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class JobDao {
    private static Connection conn;
    DatabaseConnector databaseConnector = new DatabaseConnector();

    public List<Job> getAllJobs() throws SQLException {
        Connection c = databaseConnector.getConnection();

        Statement st = c.createStatement();

        ResultSet rs = st.executeQuery("SELECT JobRole.roleID, JobRole.roleName, Band.bandName FROM JobRole" +
                " INNER JOIN Band on JobRole.bandID = Band.bandID;");

        List<Job> jobList = new ArrayList<>();

        while (rs.next()) {
            Job job = new Job(
                    rs.getInt("roleID"),
                    rs.getString("roleName"),
                    rs.getString("bandName")
            );
            jobList.add(job);
        }

        return jobList;
    }
}
