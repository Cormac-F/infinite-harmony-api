package org.kainos.ea.service;

import org.junit.Before;
import org.junit.Test;
import org.kainos.ea.api.BandService;
import org.kainos.ea.client.BandDoesNotExistException;
import org.kainos.ea.client.FailedToGetBandException;
import org.kainos.ea.client.FailedToGetBandsException;
import org.kainos.ea.cli.Band;
import org.kainos.ea.db.BandDao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.*;

public class AIBandServiceTest {

    private BandDao bandDao;
    private BandService bandService;

    @Before
    public void setUp() {
        bandDao = mock(BandDao.class);
        bandService = new BandService(bandDao);
    }

    @Test
    public void testGetBands() throws FailedToGetBandsException, SQLException {
        // Arrange
        List<Band> expectedBands = new ArrayList<>();
        expectedBands.add(new Band("1", 1));
        expectedBands.add(new Band("2", 2));

        when(bandDao.getAllBands()).thenReturn(expectedBands);

        // Act
        List<Band> actualBands = bandService.getBands();

        // Assert
        assertEquals(expectedBands, actualBands);
        verify(bandDao, times(1)).getAllBands();
    }
    @Test
    public void testGetBandByID() throws FailedToGetBandException, BandDoesNotExistException, SQLException {
        // Arrange
        int bandId = 1;
        Band expectedBand = new Band(bandId, "Band 1", 1);

        when(bandDao.getBandByID(bandId)).thenReturn(expectedBand);

        // Act
        Band actualBand = bandService.getBandByID(bandId);

        // Assert
        assertEquals(expectedBand, actualBand);
        verify(bandDao, times(1)).getBandByID(bandId);
    }

    @Test(expected = FailedToGetBandsException.class)
    public void testGetBandsThrowsFailedToGetBandsException() throws FailedToGetBandsException, SQLException {
        // Arrange
        when(bandDao.getAllBands()).thenThrow(SQLException.class);

        // Act
        bandService.getBands();

        // Assert
        // Expecting FailedToGetBandsException to be thrown
    }

    @Test(expected = BandDoesNotExistException.class)
    public void testGetBandByIDThrowsBandDoesNotExistException() throws FailedToGetBandException, BandDoesNotExistException, SQLException {
        // Arrange
        int bandId = 1;
        when(bandDao.getBandByID(bandId)).thenReturn(null);

        // Act
        bandService.getBandByID(bandId);

        // Assert
        // Expecting BandDoesNotExistException to be thrown
    }

    @Test(expected = FailedToGetBandException.class)
    public void testGetBandByIDThrowsFailedToGetBandException() throws FailedToGetBandException, BandDoesNotExistException, SQLException {
        // Arrange
        int bandId = 1;
        when(bandDao.getBandByID(bandId)).thenThrow(SQLException.class);

        // Act
        bandService.getBandByID(bandId);

        // Assert
        // Expecting FailedToGetBandException to be thrown
    }
}

