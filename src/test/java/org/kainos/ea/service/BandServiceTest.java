package org.kainos.ea.service;


import org.kainos.ea.api.BandService;
import org.kainos.ea.cli.Band;
import org.kainos.ea.client.BandDoesNotExistException;
import org.kainos.ea.client.FailedToGetBandException;
import org.kainos.ea.client.FailedToGetBandsException;
import org.kainos.ea.db.BandDao;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.ea.db.DatabaseConnector;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.Mock;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;


@ExtendWith(MockitoExtension.class)
public class BandServiceTest {
    private BandDao bandDao = Mockito.mock(BandDao.class);
    @Mock
    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    private BandService bandService = new BandService(bandDao);

    Band testBand = new Band(100, "Test", 1);

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }


    @Test
    void getBandsShouldReturnBandWhenCalled() throws FailedToGetBandsException, SQLException {
        List<Band> bandList = Arrays.asList(
                Mockito.mock(Band.class),
                Mockito.mock(Band.class)
        );
        Mockito.when(bandDao.getAllBands()).thenReturn(bandList);
        assertEquals(bandList, bandService.getBands());
    }
    @Test
    void getBandsShouldThrowFailedToGetBandsWhenSQLExcept() throws FailedToGetBandsException, SQLException {
        Mockito.when(bandDao.getAllBands()).thenThrow(SQLException.class);
        assertThrows(FailedToGetBandsException.class,
                () -> bandService.getBands());
    }

    @Test
    void getBandByIDShouldReturnBandWhenIDIs100() throws BandDoesNotExistException, FailedToGetBandException,
            SQLException {
        Mockito.when(bandDao.getBandByID(100)).thenReturn(testBand);
        assertEquals(testBand, bandService.getBandByID(100));

    }

    @Test
    void getBandByIDShouldThrowBandDoesNotExistExceptWhenIDIs1() throws BandDoesNotExistException,
            FailedToGetBandException, SQLException {
        Mockito.when(bandDao.getBandByID(1)).thenReturn(null);
        assertThrows(BandDoesNotExistException.class,
                () -> bandService.getBandByID(1));
    }

    @Test
    void getBandByIDShouldThrowFailedToGetExceptWhenSQLExceptionThrown() throws BandDoesNotExistException,
    FailedToGetBandException, SQLException {
        Mockito.when(bandDao.getBandByID(1)).thenThrow(SQLException.class);
        assertThrows(FailedToGetBandException.class,
                () -> bandService.getBandByID(1));
    }

}
