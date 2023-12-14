package org.kainos.ea.db;

import org.kainos.ea.cli.Job;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class JobDao {
    DatabaseConnector databaseConnector = new DatabaseConnector();

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
