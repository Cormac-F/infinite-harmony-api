package org.kainos.ea.client;

public class FailedToGetJobSpecException extends Exception {
    @Override
    public String getMessage() {
        return "Failed to get job spec from the database";
    }
}


