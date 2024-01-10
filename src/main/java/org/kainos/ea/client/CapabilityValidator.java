package org.kainos.ea.client;

import org.kainos.ea.cli.CapabilityRequest;

public class CapabilityValidator {
    private static final int MAX_LENGTH = 100;
    public String isValidCapability(CapabilityRequest capability) {
        if (capability.getCapabilityName().length() > MAX_LENGTH) {
            return "Capability name is too long";
        }
        return null;
    }
}
