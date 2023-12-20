package org.kainos.ea.client;

public class FailedToGetJobSpecException extends Throwable {
    @Override
    public String getMessage() {
        return "Failed to get job spec from the database";
    }
}
