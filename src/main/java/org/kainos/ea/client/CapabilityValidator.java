package org.kainos.ea.client;

import org.kainos.ea.cli.CapabilityRequest;

public class CapabilityValidator {
    private final int MAXLENGTH = 100;
    public boolean isValidCapabiility(CapabilityRequest capability) {
        if (capability.getCapabilityName().length() > MAXLENGTH) {
            return false;
        }
        return true;
    }
}
