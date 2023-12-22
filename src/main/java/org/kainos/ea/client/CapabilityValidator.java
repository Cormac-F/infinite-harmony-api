package org.kainos.ea.client;

import org.kainos.ea.cli.CapabilityRequest;

public class CapabilityValidator {
    private final int maxLength = 100;

    public String isValidCapability(CapabilityRequest capability) {
        if (capability.getCapabilityName().length() > maxLength) {
            return "Capability name is too long";
        }
        return null;
    }
}
