package org.kainos.ea.service;


import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.ea.api.BandService;
import org.kainos.ea.db.BandDao;
import org.kainos.ea.db.DatabaseConnector;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
@ExtendWith(MockitoExtension.class)
public class BandServiceTest {
    BandDao bandDao = Mockito.mock(BandDao.class);
    BandService bandService = Mockito.mock(BandService.class);

    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    Connection conn;

    @Test
    void



}
