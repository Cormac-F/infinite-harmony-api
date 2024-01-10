package org.kainos.ea.client;

public class FailedToGetBandsException extends Throwable {
    public String getMessage() {
        return "Failed to get Bands from database.";

    }
}
