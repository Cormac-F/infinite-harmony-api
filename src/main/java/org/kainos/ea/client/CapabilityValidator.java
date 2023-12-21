package org.kainos.ea.client;

import org.kainos.ea.cli.CapabilityRequest;

public class CapabilityValidator {
    public boolean isValidCapabiility(CapabilityRequest capability) {
        if (capability.getCapabilityName().length() > 100) {
            return false;
        }
        return true;
    }}
