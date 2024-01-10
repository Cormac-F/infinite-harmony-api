package org.kainos.ea.service;

import org.kainos.ea.api.ResponsibilityService;
import org.kainos.ea.cli.Responsibility;
import org.kainos.ea.client.FailedToGetRoleResponsibilityException;
import org.kainos.ea.client.RoleResponsibilityDoesNotExistException;
import org.kainos.ea.db.ResponsibilityDao;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;

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
        Mockito.when(responsibilityDao.getRoleResponsibilityByRoleId(1)).thenReturn(result);
        assertEquals(result, responsibilityService.getRoleResponsibilityByRoleId(1));
    }

    @Test
    void getRoleResponsibilityByIDThrowsRoleDoesNotExistExceptionWhenIDis0() throws
            FailedToGetRoleResponsibilityException, RoleResponsibilityDoesNotExistException, SQLException {
        List<Responsibility> result = Arrays.asList();
        Mockito.when(responsibilityDao.getRoleResponsibilityByRoleId(0)).thenReturn(result);
        assertThrows(RoleResponsibilityDoesNotExistException.class,
                () -> responsibilityService.getRoleResponsibilityByRoleId(0));
    }

    @Test
    void getRoleResponsibilityByIDThrowsFailedToGetRoleResponsibilityWhenDAOThrowsSqlExcept()
        throws SQLException, FailedToGetRoleResponsibilityException, RoleResponsibilityDoesNotExistException {
        Mockito.when(responsibilityDao.getRoleResponsibilityByRoleId(1)).thenThrow(SQLException.class);
        assertThrows(FailedToGetRoleResponsibilityException.class,
                () -> responsibilityService.getRoleResponsibilityByRoleId(1));
    }




}
