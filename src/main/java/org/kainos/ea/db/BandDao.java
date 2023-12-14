package org.kainos.ea.db;

import org.kainos.ea.cli.Band;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class BandDao {
    private static Connection conn;
    private DatabaseConnector databaseConnector = new DatabaseConnector();

    public List<Band> getAllBands() throws SQLException {
        Connection c = databaseConnector.getConnection();
        Statement st = c.createStatement();

        ResultSet rs = st.executeQuery("SELECT bandID, bandName, bandLevel FROM Band" );
        List<Band> bandList = new ArrayList<>();

        while (rs.next()) {
            Band band = new Band(
                    rs.getInt("bandID"),
                    rs.getString("bandName"),
                    rs.getInt("bandLevel")
            );
            bandList.add(band);
        }

        return bandList;
    }


    public Band getBandByID(int id) throws SQLException {
        Connection c = databaseConnector.getConnection();

        String getBand = "SELECT bandName, bandLevel FROM Band WHERE bandID = ?";

        PreparedStatement preparedStatement = c.prepareStatement(getBand);
        preparedStatement.setInt(1, id);

        ResultSet returnedVal = preparedStatement.executeQuery();

        while (returnedVal.next()) {
            return new Band(
                    id,
                    returnedVal.getString("bandName"),
                    returnedVal.getInt("bandLevel")
            );
        }

        return null;


    }


}
