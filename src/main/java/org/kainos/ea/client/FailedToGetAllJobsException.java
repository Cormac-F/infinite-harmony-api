package org.kainos.ea.client;

public class FailedToGetAllJobsException extends Throwable {

    @Override
    public String getMessage() {
        System.out.println("Test");
        return "Failed to get the list of Jobs.";
    }
}
