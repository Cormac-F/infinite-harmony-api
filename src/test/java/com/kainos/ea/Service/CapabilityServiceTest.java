package com.kainos.ea.Service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.ea.api.CapabilityService;
import org.kainos.ea.cli.Capability;
import org.kainos.ea.cli.CapabilityRequest;
import org.kainos.ea.client.CapabilityDoesNotExistException;
import org.kainos.ea.client.FailedToUpdateCapabilityException;
import org.kainos.ea.client.InvalidCapabilityException;
import org.kainos.ea.db.CapabilityDao;
import org.kainos.ea.db.DatabaseConnector;
import org.kainos.ea.resources.CapabilityController;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import static java.sql.Types.NULL;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.when;
import static org.mockito.Mockito.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.times;


@ExtendWith(MockitoExtension.class)
public class CapabilityServiceTest {
    @Mock
    private CapabilityDao capabilityDao;
    @Mock
    private CapabilityRequest capabilityRequest;
    @InjectMocks
    private CapabilityService capabilityService;
    @InjectMocks
    private CapabilityController capabilityController;
    @Mock
    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    @Mock
    Connection conn;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    Capability testCapability = new Capability(1, "test");
    static final int RES = 500;
    static final int IDFAIL = 100;
    static final int IDPASS = 1;

    static final int IDNULL = NULL;

    @Test
    void getCapabilitiesShouldReturnCapabilitiesWhenDaoReturnsCapabilities() throws SQLException {
        List<Capability> listCapabilities = Arrays.asList(
                Mockito.mock(Capability.class),
                Mockito.mock(Capability.class)
        );

        when(capabilityDao.getAllCapabilities()).thenReturn(listCapabilities);
        List<Capability> returnedVals = capabilityDao.getAllCapabilities();

        assertEquals(listCapabilities, returnedVals);

    }


    @Test
    void getCapabilityShouldReturnCapabilityWhenCalled() throws SQLException {
        when(capabilityDao.getCapabilityByID(IDPASS)).thenReturn(testCapability);

        assertEquals(testCapability, capabilityDao.getCapabilityByID(IDPASS));

    }
    @Test
    void updateCapabilityShouldThrowCapabilityDoesNotExistExceptionWhenCapabilityIsNull() throws SQLException {
        int id = 1;
        CapabilityRequest capabilityRequest = new CapabilityRequest("");
        when(capabilityDao.getCapabilityByID(id)).thenReturn(null);

        assertThrows(CapabilityDoesNotExistException.class,
                () -> capabilityService.updateCapability(id, capabilityRequest));
        verify(capabilityDao, never()).updateCapability(anyInt(), any(CapabilityRequest.class));
    }
    @Test
    void updateCapabilityShouldThrowFailedToUpdateCapabilityExceptionWhenSQLExceptionOccurs() throws SQLException {
        int id = 1;
        CapabilityRequest capabilityRequest = new CapabilityRequest("test");

        when(capabilityDao.getCapabilityByID(id)).thenReturn(new Capability(12, "people"));
        doThrow(SQLException.class).when(capabilityDao).updateCapability(id, capabilityRequest);

        assertThrows(FailedToUpdateCapabilityException.class,
                () -> capabilityService.updateCapability(id, capabilityRequest));
        verify(capabilityDao, times(1)).updateCapability(eq(id), eq(capabilityRequest));
    }


    @Test
    void updateCapabilityShouldUpdateCapabilityWhenCapabilityExists()
            throws SQLException, CapabilityDoesNotExistException, FailedToUpdateCapabilityException,
            InvalidCapabilityException {

        int id = 1;
        CapabilityRequest capabilityRequest = new CapabilityRequest("test");
        Capability existingCapability = new Capability(1, "test");

        when(capabilityDao.getCapabilityByID(id)).thenReturn(existingCapability);

        capabilityService.updateCapability(id, capabilityRequest);
        verify(capabilityDao, times(1)).updateCapability(eq(id), eq(capabilityRequest));
    }

}


