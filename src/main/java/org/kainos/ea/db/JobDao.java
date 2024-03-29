package org.kainos.ea.db;

import org.kainos.ea.cli.Job;
import org.kainos.ea.cli.JobRequest;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class JobDao {
    private DatabaseConnector databaseConnector;

    public JobDao(DatabaseConnector databaseConnector) {
        this.databaseConnector = databaseConnector;
    }


    public List<Job> getAllJobs() throws SQLException {
        Connection c = databaseConnector.getConnection();

        String query = "SELECT roleID, roleName, specSummary, sharepointLink FROM JobRole WHERE roleID = ?";
        PreparedStatement ps = c.prepareStatement(query);
//        ps.setInt(1, id);

        Statement st = c.createStatement();

        ResultSet rs = st.executeQuery("SELECT roleID, roleName, Band.bandID, JobFamily.familyID, "
                + "Band.bandName, JobRole.specSummary, JobRole.sharepointLink, "
                + "Band.bandName, Capability.capabilityName \n"
                + "FROM JobRole\n"
                + "INNER JOIN JobFamily ON JobRole.familyID = JobFamily.familyID\n"
                + "INNER JOIN Band ON JobRole.bandID = Band.bandID\n"
                + "INNER JOIN Capability ON JobFamily.capabilityID = Capability.capabilityID\n"
                + "ORDER BY Capability.capabilityName ASC, roleName ASC");

        List<Job> jobList = new ArrayList<>();

        while (rs.next()) {
            Job job = new Job(
                    rs.getInt("roleID"),
                    rs.getString("roleName"),
                    rs.getInt("bandID"),
                    rs.getInt("familyID"),
                    rs.getString("specSummary"),
                    rs.getString("sharepointLink"),
                    rs.getString("capabilityName"),
                    rs.getString("bandName")
            );
            jobList.add(job);
        }

        return jobList;
    }

    public Job getJobSpecById(int id) throws SQLException {
        Connection c = databaseConnector.getConnection();

        PreparedStatement ps = null;

        ResultSet rs = null;


        String query = "SELECT roleID, roleName, Band.bandID, JobFamily.familyID, Band.bandName, "
                + "JobRole.specSummary, JobRole.sharepointLink, Capability.capabilityName FROM JobRole\n"
                + "INNER JOIN JobFamily ON JobRole.familyID = JobFamily.familyID\n"
                + "INNER JOIN Band ON JobRole.bandID = Band.bandID\n"
                + "INNER JOIN Capability ON JobFamily.capabilityID = Capability.capabilityID\n"
                + "WHERE roleID = ?";

        ps = c.prepareStatement(query);
        ps.setInt(1, id);

        rs = ps.executeQuery();

        while (rs.next()) {
            return new Job(
                    rs.getInt("roleID"),
                    rs.getString("roleName"),
                    rs.getInt("bandID"),
                    rs.getInt("familyID"),
                    rs.getString("specSummary"),
                    rs.getString("sharepointLink"),
                    rs.getString("capabilityName"),
                    rs.getString("bandName")
            );
        }

        return null;
    }

    public void updateJob(int id, JobRequest job) throws SQLException {
        Connection c = databaseConnector.getConnection();

        String updateStatement = "UPDATE JobRole\n "
                + "SET roleName = ?,\n "
                + "bandID = ?,\n "
                + "familyID = ?,\n "
                + "specSummary = ?,\n "
                + "sharepointLink = ?\n "
                + "WHERE roleID = ?;";

        PreparedStatement st = c.prepareStatement(updateStatement);

        st.setString(1, job.getRoleName());
        st.setInt(2, job.getBandID());
        st.setInt(3, job.getFamilyID());
        st.setString(4, job.getSpecSummary());
        st.setString(5, job.getSharepointLink());
        st.setInt(6, id);

        st.executeUpdate();

        String updateResponsibility = "INSERT INTO Responsibility_JobRole(responsibilityID, roleID) VALUES(?,?);";

        PreparedStatement linkTableStmt = c.prepareStatement(updateResponsibility);

        linkTableStmt.setInt(1, job.getResponsibilityID());
        linkTableStmt.setInt(2, id);

        linkTableStmt.executeUpdate();

    }
}
