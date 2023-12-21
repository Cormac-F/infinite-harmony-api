package org.kainos.ea.service;

import io.dropwizard.auth.Auth;
import org.checkerframework.checker.units.qual.A;
import org.kainos.ea.cli.Login;
import org.kainos.ea.db.AuthDao;
import org.kainos.ea.api.AuthService;
import org.kainos.ea.resources.AuthController;
import org.kainos.ea.client.FailedToLoginException;
import org.kainos.ea.client.FailedToGenerateTokenException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.ea.db.DatabaseConnector;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.InjectMocks;
import org.mockito.Mock;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.when;


@ExtendWith(MockitoExtension.class)
public class AuthServiceTest {
    @Mock
    private AuthDao authDao = Mockito.mock(AuthDao.class);
    @Mock
    private AuthController authController;
    @Mock
    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);


    private AuthService authService = new AuthService(authDao, databaseConnector);
    @Mock
    Connection conn;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }
    Login login = new Login("username","password");

    //TODO: FINISH IMPLEMENTING JOSH'S FIXES
    //TODO: this involves something to do with following shawn ganley's code on sams repo lol


    @Test
    void loginShouldGenerateTokenWhenValidLoginGiven() throws SQLException, FailedToLoginException, FailedToGenerateTokenException {
        when(authDao.validLogin(login)).thenReturn(true);
        when(authDao.generateToken("username")).thenReturn("Token");
        String token = authService.login(login);
        assertEquals("Token", token);
    }

}
