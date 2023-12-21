package org.kainos.ea.api;

import io.swagger.models.auth.In;
import org.kainos.ea.cli.Capability;
import org.kainos.ea.cli.CapabilityRequest;
import org.kainos.ea.client.*;
import org.kainos.ea.db.CapabilityDao;

import java.sql.SQLException;
import java.util.List;

public class CapabilityService {
    private CapabilityDao capabilityDao = new CapabilityDao();
    private CapabilityValidator capabilityValidator = new CapabilityValidator();

    public List<Capability> getAllCapabilities() throws FailedToGetCapabilitiesException {
        List<Capability> capabilityList;

        try {
            capabilityList = capabilityDao.getAllCapabilities();
        } catch (SQLException e) {
            System.err.println(e.getMessage());

            throw new FailedToGetCapabilitiesException();
        }

        return capabilityList;

    }
    public Capability getCapabilityByID(int id) throws FailedToGetCapabilityException {
        Capability capability;
        try {
            capability = capabilityDao.getCapabilityByID(id);

        } catch (SQLException e) {
            System.err.println(e.getMessage());

            throw new FailedToGetCapabilityException();
        }
        return capability;
    }

    public void updateCapability(int id, CapabilityRequest capability) throws CapabilityDoesNotExistException,
            FailedToUpdateCapabilityException, InvalidCapabilityException, SQLException {

        try {
            String validation = String.valueOf(capabilityValidator.isValidCapabiility(capability));

            if (validation != null) {
                throw new InvalidCapabilityException(validation);
            }

            Capability capabilityToUpdate;
            capabilityToUpdate = capabilityDao.getCapabilityByID(id);

            if (capabilityToUpdate == null) {
                throw new CapabilityDoesNotExistException();
            }

            capabilityDao.updateCapability(id, capability);
        } catch (SQLException e) {
            System.err.println(e.getMessage());

            throw new FailedToUpdateCapabilityException();
        } catch (InvalidCapabilityException e) {
            throw new RuntimeException(e);
        }
    }
}



