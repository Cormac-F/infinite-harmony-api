package org.kainos.ea.service;

import org.kainos.ea.cli.Login;
import org.kainos.ea.db.AuthDao;
import org.kainos.ea.api.AuthService;
import org.kainos.ea.client.FailedToLoginException;
import org.kainos.ea.client.FailedToGenerateTokenException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import static org.mockito.Mockito.when;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.sql.SQLException;


@ExtendWith(MockitoExtension.class)
public class AuthServiceTest {

    private AuthDao authDao = Mockito.mock(AuthDao.class);
    private AuthService authService = new AuthService(authDao);

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }
    Login login = new Login("username","password");
    @Test
    void loginShouldGenerateTokenWhenValidLoginGiven() throws SQLException, FailedToLoginException,
            FailedToGenerateTokenException {
        when(authDao.validLogin(login)).thenReturn(true);
        when(authDao.generateToken("username")).thenReturn("Token");
        String token = authService.login(login);
        assertEquals("Token", token);
    }

    @Test
    void loginShouldThrowFailedToLoginExceptionWhenInvalidLoginGiven() {
        when(authDao.validLogin(login)).thenReturn(false);
        assertThrows(FailedToLoginException.class,
                () -> authService.login(login));
    }

    @Test
    void loginShouldThrowTokenExceptWhenGenerateTokenFails() throws SQLException, FailedToGenerateTokenException {
        when(authDao.validLogin(login)).thenReturn(true);
        when(authDao.generateToken("username")).thenThrow(SQLException.class);
        assertThrows(FailedToGenerateTokenException.class,
                () -> authService.login(login));
    }

}