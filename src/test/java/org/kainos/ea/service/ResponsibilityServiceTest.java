package org.kainos.ea.service;

import org.kainos.ea.api.BandService;
import org.kainos.ea.api.ResponsibilityService;
import org.kainos.ea.cli.Responsibility;
import org.kainos.ea.client.FailedToGetRoleResponsibilityException;
import org.kainos.ea.client.RoleResponsibilityDoesNotExistException;
import org.kainos.ea.db.ResponsibilityDao;

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
public class ResponsibilityServiceTest {
    private ResponsibilityDao responsibilityDao = Mockito.mock(ResponsibilityDao.class);
    private ResponsibilityService responsibilityService = new ResponsibilityService(responsibilityDao);

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }
    @Test
    void getRoleResponsibilityByIdReturnsResponsibilityWhenIDIs1() throws FailedToGetRoleResponsibilityException,
            RoleResponsibilityDoesNotExistException, SQLException {
        List<Responsibility> result = Arrays.asList(
                Mockito.mock(Responsibility.class),
                Mockito.mock(Responsibility.class)
        );
        Mockito.when(responsibilityDao.getRoleResponsibilityById(1)).thenReturn(result);
        assertEquals(result, responsibilityService.getRoleResponsibilityById(1));
    }

    @Test
    void getRoleResponsibilityByIDThrowsRoleDoesNotExistExceptionWhenIDis0() throws
            FailedToGetRoleResponsibilityException, RoleResponsibilityDoesNotExistException, SQLException {
        Mockito.when(responsibilityDao.getRoleResponsibilityById(0)).thenReturn(null);
        assertThrows(RoleResponsibilityDoesNotExistException.class,
                () -> responsibilityService.getRoleResponsibilityById(0));
    }

    @Test
    void getRoleResponsibilityByIDThrowsFailedToGetRoleResponsibilityWhenDAOThrowsSqlExcept()
        throws SQLException, FailedToGetRoleResponsibilityException, RoleResponsibilityDoesNotExistException {
        Mockito.when(responsibilityDao.getRoleResponsibilityById(1)).thenThrow(SQLException.class);
        assertThrows(FailedToGetRoleResponsibilityException.class,
                () -> responsibilityService.getRoleResponsibilityById(1));
    }




}
