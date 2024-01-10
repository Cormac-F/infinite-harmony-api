package org.kainos.ea.client;

public class JobDoesNotExistException extends Exception {
    public String getMessage() {
        return "Job does not exist"; }
}
