package org.kainos.ea.api;

import org.kainos.ea.cli.Responsibility;
import org.kainos.ea.client.FailedToGetRoleResponsibilityException;
import org.kainos.ea.client.RoleResponsibilityDoesNotExistException;
import org.kainos.ea.db.ResponsibilityDao;

import java.sql.SQLException;
import java.util.List;

public class ResponsibilityService {
    private ResponsibilityDao responsibilityDao;

    public ResponsibilityService(ResponsibilityDao responsibilityDao) {
        this.responsibilityDao = responsibilityDao;
    }

    public List<Responsibility> getRoleResponsibilityById(int id) throws FailedToGetRoleResponsibilityException,
            RoleResponsibilityDoesNotExistException {
        List<Responsibility> responsibilitiesList = null;
        try {
            responsibilitiesList = responsibilityDao.getRoleResponsibilityById(id);

            if (responsibilitiesList == null) {
                throw new RoleResponsibilityDoesNotExistException();
            }

            return responsibilitiesList;
        } catch (SQLException e) {
            System.err.println(e.getMessage());

            throw new FailedToGetRoleResponsibilityException();
        }
    }
}
