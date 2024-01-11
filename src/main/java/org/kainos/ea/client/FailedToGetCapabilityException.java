package org.kainos.ea.client;

public class FailedToGetCapabilityException extends Exception {
    @Override
    public String getMessage() {
        return "Failed to get Capability";
    }
}
