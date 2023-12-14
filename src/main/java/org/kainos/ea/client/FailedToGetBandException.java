package org.kainos.ea.client;

public class FailedToGetBandException extends Throwable {
    public String getMessage() {
        return "Failed to get specific band.";
    }
}
