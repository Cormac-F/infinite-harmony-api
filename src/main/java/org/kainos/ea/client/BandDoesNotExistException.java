package org.kainos.ea.client;

public class BandDoesNotExistException extends Throwable {
    @Override
    public String getMessage() {
        return "The band ID specified does not exist.";
    }
}
