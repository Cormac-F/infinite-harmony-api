package org.kainos.ea.client;

public class FailedToGetAllJobsException extends Exception {
    public String getMessage() {return "Failed to select all jobs from database";}
}
