package org.kainos.ea.service;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.ea.api.BandService;
import org.kainos.ea.cli.Band;
import org.kainos.ea.client.FailedToGetBandsException;
import org.kainos.ea.db.BandDao;
import org.kainos.ea.db.DatabaseConnector;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
@ExtendWith(MockitoExtension.class)
public class BandServiceTest {
    @Mock
    BandDao bandDao = Mockito.mock(BandDao.class);
    @Mock
    BandService bandService = Mockito.mock(BandService.class);
    @Mock
    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    Connection conn;

    @BeforeEach
    void setup() {
        MockitoAnnotations.openMocks(this);
    }


    @Test
    void getBandsShouldReturnBandsWhenDaoReturnsBands() throws SQLException, FailedToGetBandsException {
        List<Band> listBands = Arrays.asList(
                Mockito.mock(Band.class),
                Mockito.mock(Band.class)
        );

        Mockito.when(bandDao.getAllBands()).thenReturn(listBands);
        List<Band> returnedVals = bandDao.getAllBands();

        assertEquals(listBands, returnedVals);

    }

    @Test
    void getBandsShouldThrowFailedToGetBandsWhenSQLExceptThrown() throws SQLException, FailedToGetBandsException {
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(bandDao.getAllBands()).thenReturn(null);

        assertThrows(FailedToGetBandsException.class, () -> bandDao.getAllBands());
    }


}
