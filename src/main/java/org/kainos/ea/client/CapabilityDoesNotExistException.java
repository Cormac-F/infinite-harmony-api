package org.kainos.ea.client;

public class CapabilityDoesNotExistException extends Exception {
    @Override
    public String getMessage() {
        return "Capability does not exist";
    }
}
