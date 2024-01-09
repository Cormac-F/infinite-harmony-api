package org.kainos.ea.client;

public class FailedToUpdateCapabilityException extends Exception {
    @Override
    public String getMessage() {
        return "Failed to update Capability";
    }
}
