package org.kainos.ea.client;

public class FailedToGetCapabilitiesException extends Exception {
    @Override
    public String getMessage() {
        return "Failed to get Capabilities";
    }
}
