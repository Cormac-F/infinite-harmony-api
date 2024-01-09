package org.kainos.ea.api;

import org.kainos.ea.cli.Band;
import org.kainos.ea.client.BandDoesNotExistException;
import org.kainos.ea.client.FailedToGetBandException;
import org.kainos.ea.client.FailedToGetBandsException;
import org.kainos.ea.db.BandDao;
import org.kainos.ea.db.DatabaseConnector;

import java.sql.SQLException;
import java.util.List;

public class BandService {

    private BandDao bandDao;
    DatabaseConnector databaseConnector;
    public BandService(BandDao bd) {
        bandDao = bd;
    }


    public List<Band> getBands() throws FailedToGetBandsException {
        List<Band> bandList;

        try {
            bandList = bandDao.getAllBands();
        } catch (SQLException e) {
            System.err.println(e.getMessage());

            throw new FailedToGetBandsException();
        }

        return bandList;


    }

    public Band getBandByID(int id) throws FailedToGetBandException, BandDoesNotExistException {
        Band band = new Band();
        try {
            band = bandDao.getBandByID(id);

            if (band == null) {
                throw new BandDoesNotExistException();
            }

        } catch (SQLException e) {
            System.err.println(e.getMessage());

            throw new FailedToGetBandException();
        }

        return band;
    }
}
