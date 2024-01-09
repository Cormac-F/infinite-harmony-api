package org.kainos.ea.client;

public class JobSpecDoesNotExistException extends Throwable {
    @Override
    public String getMessage() {
        return "Job Specification does not exist in the database";
    }
}
