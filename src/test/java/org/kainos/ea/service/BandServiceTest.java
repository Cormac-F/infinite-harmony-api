package org.kainos.ea.service;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.ea.api.BandService;
import org.kainos.ea.cli.Band;
import org.kainos.ea.client.FailedToGetBandsException;
import org.kainos.ea.db.BandDao;
import org.kainos.ea.db.DatabaseConnector;
import org.kainos.ea.resources.BandController;
import org.mockito.*;
import org.mockito.junit.jupiter.MockitoExtension;

import javax.ws.rs.core.Response;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
@ExtendWith(MockitoExtension.class)
public class BandServiceTest {
    @Mock
    private BandDao bandDao = Mockito.mock(BandDao.class);
    @Mock
    private BandService bandService = Mockito.mock(BandService.class);
    @InjectMocks
    private BandController bandController = Mockito.mock(BandController.class);
    @Mock
    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    @Mock
    Connection conn;

    @BeforeEach
    void setUp() {
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
        Mockito.when(bandService).thenThrow(new FailedToGetBandsException());
        Response response = bandController.getAllBands();
        assertEquals(500, response.getStatus());
    }


}
