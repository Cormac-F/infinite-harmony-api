package org.kainos.ea.service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.ea.api.CapabilityService;
import org.kainos.ea.cli.Capability;
import org.kainos.ea.cli.CapabilityRequest;
import org.kainos.ea.client.CapabilityValidator;
import org.kainos.ea.client.CapabilityDoesNotExistException;
import org.kainos.ea.client.FailedToGetCapabilitiesException;
import org.kainos.ea.client.FailedToGetCapabilityException;
import org.kainos.ea.client.FailedToUpdateCapabilityException;
import org.kainos.ea.client.InvalidCapabilityException;
import org.kainos.ea.db.CapabilityDao;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

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
    private CapabilityDao capabilityDao = Mockito.mock(CapabilityDao.class);
    private CapabilityValidator capabilityValidator = Mockito.mock(CapabilityValidator.class);
    private CapabilityService capabilityService = new CapabilityService(capabilityDao, capabilityValidator);

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    Capability testCapability = new Capability(1, "test");

    @Test
    void getCapabilitiesShouldReturnCapabilitiesWhenDaoReturnsCapabilities() throws SQLException,
            FailedToGetCapabilitiesException {
        List<Capability> listCapabilities = Arrays.asList(
                Mockito.mock(Capability.class),
                Mockito.mock(Capability.class)
        );
        when(capabilityDao.getAllCapabilities()).thenReturn(listCapabilities);
        assertEquals(listCapabilities, capabilityService.getAllCapabilities());
    }

    @Test
    void getCapabilityShouldReturnCapabilityWhenCalled() throws SQLException, FailedToGetCapabilityException,
            CapabilityDoesNotExistException {
        when(capabilityDao.getCapabilityByID(1)).thenReturn(testCapability);

        assertEquals(testCapability, capabilityService.getCapabilityByID(1));

    }

    @Test
    void updateCapabilityShouldThrowCapabilityDoesNotExistExceptionWhenCapabilityIsNull() throws SQLException {
        CapabilityRequest capabilityRequest = new CapabilityRequest("");
        when(capabilityDao.getCapabilityByID(1)).thenReturn(null);

        assertThrows(CapabilityDoesNotExistException.class,
                () -> capabilityService.updateCapability(1, capabilityRequest));
        verify(capabilityDao, never()).updateCapability(anyInt(), any(CapabilityRequest.class));
    }

    @Test
    void updateCapabilityShouldThrowFailedToUpdateCapabilityExceptionWhenSQLExceptionOccurs() throws SQLException {
        CapabilityRequest capabilityRequest = new CapabilityRequest("test");

        when(capabilityDao.getCapabilityByID(1)).thenReturn(new Capability(12, "people"));
        doThrow(SQLException.class).when(capabilityDao).updateCapability(1, capabilityRequest);

        assertThrows(FailedToUpdateCapabilityException.class,
                () -> capabilityService.updateCapability(1, capabilityRequest));
        verify(capabilityDao, times(1)).updateCapability(eq(1), eq(capabilityRequest));
    }


    @Test
    void updateCapabilityShouldUpdateCapabilityWhenCapabilityExists()
            throws SQLException, CapabilityDoesNotExistException, FailedToUpdateCapabilityException,
            InvalidCapabilityException {

        CapabilityRequest capabilityRequest = new CapabilityRequest("test");
        Capability existingCapability = new Capability(1, "test");

        when(capabilityDao.getCapabilityByID(1)).thenReturn(existingCapability);

        capabilityService.updateCapability(1, capabilityRequest);
        verify(capabilityDao, times(1)).updateCapability(eq(1), eq(capabilityRequest));
    }
}


