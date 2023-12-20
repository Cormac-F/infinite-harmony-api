package org.kainos.ea.db;

import org.kainos.ea.cli.Capability;
import org.kainos.ea.cli.CapabilityRequest;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CapabilityDao {
    private static Connection conn;
    private DatabaseConnector databaseConnector = new DatabaseConnector();

    public List<Capability> getAllCapabilities() throws SQLException {
        Connection c = databaseConnector.getConnection();
        Statement st = c.createStatement();

        ResultSet rs = st.executeQuery("SELECT capabilityID, capabilityName FROM Capability");
        List<Capability> capabilityList = new ArrayList<>();

        while (rs.next()) {
            Capability capability = new Capability(
                    rs.getInt("capabilityID"),
                    rs.getString("capabilityName")
            );
            capabilityList.add(capability);
        }
        return capabilityList;
    }
    public Capability getCapabilityByID(int id) throws SQLException {
        Connection c = databaseConnector.getConnection();

        String getCapability = "SELECT capabilityName FROM Capability WHERE capabilityID = ?";

        PreparedStatement preparedStatement = c.prepareStatement(getCapability);
        preparedStatement.setInt(1, id);

        ResultSet returnedVal = preparedStatement.executeQuery();

        while (returnedVal.next()) {
            return new Capability(
                    id,
                    returnedVal.getString("capabilityName")
            );
        }
        return null;
    }
    public void updateCapability(int capabilityID, CapabilityRequest capability) throws SQLException {
        Connection c = databaseConnector.getConnection();

        String updateStatement = "UPDATE Capability SET capabilityName = ? WHERE capabilityID = ?";

        PreparedStatement st = c.prepareStatement(updateStatement);

        st.setString(1,capability.getCapabilityName());
        st.setInt(2,capabilityID);

        st.executeUpdate();
    }

}


