package org.kainos.ea.api;

import org.kainos.ea.cli.Band;
import org.kainos.ea.client.FailedToGetBandException;
import org.kainos.ea.client.FailedToGetBandsException;
import org.kainos.ea.db.BandDao;

import java.sql.SQLException;
import java.util.List;

public class BandService {

    private BandDao bandDao = new BandDao();

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

    public Band getBandByID(int id) throws FailedToGetBandException {
        Band band = new Band();
        try {
            band = bandDao.getBandByID(id);

        } catch (SQLException e) {
            System.err.println(e.getMessage());

            throw new FailedToGetBandException();
        }

        return band;
    }
}
