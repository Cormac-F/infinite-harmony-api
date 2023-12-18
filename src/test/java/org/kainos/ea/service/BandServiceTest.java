package org.kainos.ea.service;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.ea.api.BandService;
import org.kainos.ea.cli.Band;
import org.kainos.ea.client.FailedToGetBandException;
import org.kainos.ea.client.FailedToGetBandsException;
import org.kainos.ea.db.BandDao;
import org.kainos.ea.db.DatabaseConnector;
import org.kainos.ea.resources.BandController;
import org.mockito.*;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import javax.ws.rs.core.Response;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class BandServiceTest {
    @Mock
    private BandDao bandDao = Mockito.mock(BandDao.class);
    @Mock
    private BandService bandService;
    @InjectMocks
    private BandController bandController;
    @Mock
    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    @Mock
    Connection conn;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }
    Band testBand = new Band("Test", 1);

    @Test
    void getBandsShouldReturnBandsWhenDaoReturnsBands() throws SQLException, FailedToGetBandsException {
        List<Band> listBands = Arrays.asList(
                Mockito.mock(Band.class),
                Mockito.mock(Band.class)
        );

        when(bandDao.getAllBands()).thenReturn(listBands);
        List<Band> returnedVals = bandDao.getAllBands();

        assertEquals(listBands, returnedVals);

    }

    @Test
    void getBandsShouldThrowFailedToGetBandsWhenSQLExceptThrown() throws FailedToGetBandsException {
        when(bandService.getBands()).thenThrow(new FailedToGetBandsException());

        assertEquals(500, bandController.getAllBands().getStatus());
    }

    @Test
    void getBandShouldReturnBandWhenCalled() throws SQLException {
        Mockito.when(bandDao.getBandByID(1)).thenReturn(testBand);

        assertEquals(testBand, bandDao.getBandByID(1));

    }

    @Test
    void getBandShouldReturnFailedToGetBandExceptionWhenIDIs9() throws FailedToGetBandException, SQLException {
        Mockito.when(bandService.getBandByID(9)).thenThrow(FailedToGetBandException.class);
        assertThrows(FailedToGetBandException.class,() -> bandService.getBandByID(9));

    }


}
