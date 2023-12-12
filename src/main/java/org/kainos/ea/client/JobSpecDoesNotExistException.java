package org.kainos.ea.client;

public class JobSpecDoesNotExistException extends Exception {
    @Override
    public String getMessage() {
            return "Job spec does not exist in the database";
        }
}

