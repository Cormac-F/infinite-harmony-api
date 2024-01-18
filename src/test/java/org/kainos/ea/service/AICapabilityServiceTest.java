package org.kainos.ea.service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.ea.api.CapabilityService;
import org.kainos.ea.cli.Capability;
import org.kainos.ea.cli.CapabilityRequest;
import org.kainos.ea.client.*;
import org.kainos.ea.db.CapabilityDao;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class AICapabilityServiceTest {
    @Mock
    private CapabilityDao capabilityDao;

    @Mock
    private CapabilityValidator capabilityValidator;

    private CapabilityService capabilityService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        capabilityService = new CapabilityService(capabilityDao, capabilityValidator);
    }

    @Test
    void getAllCapabilitiesShouldReturnCapabilitiesWhenDaoReturnsCapabilities() throws SQLException, FailedToGetCapabilitiesException {
        // Arrange
        List<Capability> listCapabilities = Arrays.asList(
                new Capability(1, "Capability 1"),
                new Capability(2, "Capability 2")
        );
        when(capabilityDao.getAllCapabilities()).thenReturn(listCapabilities);

        // Act
        List<Capability> result = capabilityService.getAllCapabilities();

        // Assert
        assertEquals(listCapabilities, result);
    }

    @Test
    void getCapabilityByIDShouldReturnCapabilityWhenCalled() throws SQLException, FailedToGetCapabilityException, CapabilityDoesNotExistException {
        // Arrange
        int capabilityId = 1;
        Capability expectedCapability = new Capability(capabilityId, "Test Capability");
        when(capabilityDao.getCapabilityByID(capabilityId)).thenReturn(expectedCapability);

        // Act
        Capability result = capabilityService.getCapabilityByID(capabilityId);

        // Assert
        assertEquals(expectedCapability, result);
    }

    @Test
    void getCapabilityByIDShouldThrowFailedToGetCapabilityExceptionWhenDaoThrowsSQLException() throws SQLException {
        // Arrange
        int capabilityId = 1;
        when(capabilityDao.getCapabilityByID(capabilityId)).thenThrow(new SQLException());

        // Act & Assert
        assertThrows(FailedToGetCapabilityException.class, () -> capabilityService.getCapabilityByID(capabilityId));
    }

    @Test
    void getCapabilityByIDShouldThrowCapabilityDoesNotExistExceptionWhenCapabilityIsNull() throws SQLException {
        // Arrange
        int capabilityId = 1;
        when(capabilityDao.getCapabilityByID(capabilityId)).thenReturn(null);

        // Act & Assert
        assertThrows(CapabilityDoesNotExistException.class, () -> capabilityService.getCapabilityByID(capabilityId));
    }

    @Test
    void updateCapabilityShouldThrowFailedToUpdateCapabilityExceptionWhenDaoThrowsSQLException() throws SQLException, InvalidCapabilityException, CapabilityDoesNotExistException {
        // Arrange
        int capabilityId = 1;
        CapabilityRequest capabilityRequest = new CapabilityRequest("Updated Capability");
        when(capabilityDao.getCapabilityByID(capabilityId)).thenReturn(new Capability(capabilityId, "Existing Capability"));
        doThrow(new SQLException()).when(capabilityDao).updateCapability(capabilityId, capabilityRequest);

        // Act & Assert
        assertThrows(FailedToUpdateCapabilityException.class, () -> capabilityService.updateCapability(capabilityId, capabilityRequest));
    }

    @Test
    void updateCapabilityShouldThrowInvalidCapabilityExceptionWhenCapabilityValidatorReturnsErrorMessage() throws SQLException, InvalidCapabilityException, CapabilityDoesNotExistException {
        // Arrange
        int capabilityId = 1;
        CapabilityRequest capabilityRequest = new CapabilityRequest("Invalid Capability");
        when(capabilityValidator.isValidCapability(capabilityRequest)).thenReturn("Invalid capability");

        // Act & Assert
        assertThrows(InvalidCapabilityException.class, () -> capabilityService.updateCapability(capabilityId, capabilityRequest));
        verify(capabilityDao, never()).updateCapability(anyInt(), any(CapabilityRequest.class));
    }

    @Test
    void updateCapabilityShouldUpdateCapabilityWhenCapabilityExists() throws SQLException, InvalidCapabilityException, CapabilityDoesNotExistException, FailedToUpdateCapabilityException {
        // Arrange
        int capabilityId = 1; CapabilityRequest capabilityRequest = new CapabilityRequest("Updated Capability"); Capability existingCapability = new Capability(capabilityId, "Existing Capability"); when(capabilityDao.getCapabilityByID(capabilityId)).thenReturn(existingCapability);
        // Act
        capabilityService.updateCapability(capabilityId, capabilityRequest);

        // Assert
        verify(capabilityDao, times(1)).updateCapability(capabilityId, capabilityRequest);
    }
}