package service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.ea.api.ResponsibilityService;
import org.kainos.ea.cli.Responsibility;
import org.kainos.ea.client.FailedToGetRoleResponsibilityException;
import org.kainos.ea.client.RoleResponsibilityDoesNotExistException;
import org.kainos.ea.db.DatabaseConnector;
import org.kainos.ea.db.ResponsibilityDao;
import org.kainos.ea.resources.ResponsibilityController;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class ResponsibilityServiceTest {
    @Mock
    private ResponsibilityDao responsibilityDao = Mockito.mock(ResponsibilityDao.class);
    @Mock
    private ResponsibilityService responsibilityService;
    @InjectMocks
    private ResponsibilityController responsibilityController;
    @Mock
    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    @Mock
    Connection conn;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    Responsibility testResponsibility = new Responsibility();
    static final String TEST_RESPONSIBILITY_NAME = "Test Responsibility Name";

    @Test
    void getRoleResponsibilityByIdshouldReturnResponsibilitywhenResponsibilityExists() throws SQLException,
            FailedToGetRoleResponsibilityException, RoleResponsibilityDoesNotExistException {
        List<Responsibility> listResponsibility = responsibilityDao.getRoleResponsibilityById(1);
        when(responsibilityDao.getRoleResponsibilityById(1)).thenReturn(listResponsibility);
        List<Responsibility> returnedVals = responsibilityDao.getRoleResponsibilityById(1);

        assertEquals(returnedVals, listResponsibility);
    }

    @Test
    void getRoleResponsibilityByIdshouldReturnSQLException() throws SQLException,
            FailedToGetRoleResponsibilityException, RoleResponsibilityDoesNotExistException {
        when(responsibilityDao.getRoleResponsibilityById(1)).thenThrow(SQLException.class);
        try {
            responsibilityDao.getRoleResponsibilityById(1);
        } catch (SQLException e) {
            assertEquals(e.getMessage(), null);
        }
    }
}
