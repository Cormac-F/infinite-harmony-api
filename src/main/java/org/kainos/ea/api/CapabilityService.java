package org.kainos.ea.api;

import org.kainos.ea.cli.Capability;
import org.kainos.ea.cli.CapabilityRequest;
import org.kainos.ea.client.CapabilityDoesNotExistException;
import org.kainos.ea.client.FailedToGetCapabilitiesException;
import org.kainos.ea.client.FailedToGetCapabilityException;
import org.kainos.ea.client.FailedToUpdateCapabilityException;
import org.kainos.ea.db.CapabilityDao;

import java.sql.SQLException;
import java.util.List;

public class CapabilityService {
    private CapabilityDao capabilityDao = new CapabilityDao();

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

    public void updateCapability(int id, CapabilityRequest capability) throws CapabilityDoesNotExistException, FailedToUpdateCapabilityException, SQLException {
            Capability capabilityToUpdate;
        try{
            capabilityToUpdate = capabilityDao.getCapabilityByID(id);

            if (capabilityToUpdate == null){
                throw new CapabilityDoesNotExistException();
            }

            capabilityDao.updateCapability(id, capability);
        } catch (SQLException e) {
            System.err.println(e.getMessage());

            throw new FailedToUpdateCapabilityException();
        }
    }
}



