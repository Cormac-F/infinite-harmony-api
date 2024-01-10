package org.kainos.ea.api;

import org.kainos.ea.cli.Login;
import org.kainos.ea.client.FailedToGenerateTokenException;
import org.kainos.ea.client.FailedToLoginException;
import org.kainos.ea.db.AuthDao;
import org.kainos.ea.db.DatabaseConnector;

import javax.xml.crypto.Data;
import java.sql.SQLException;



public class AuthService {

    private AuthDao authDao;
    public AuthService(AuthDao authDao) {
        this.authDao = authDao;
    }


    public String login(Login login) throws FailedToLoginException, FailedToGenerateTokenException {
        if(authDao.validLogin(login)) {
            try {
                return authDao.generateToken(login.getUsername());
            }
            catch (SQLException e) {
                throw new FailedToGenerateTokenException();
            }
        }

        throw new FailedToLoginException();
    }
}
