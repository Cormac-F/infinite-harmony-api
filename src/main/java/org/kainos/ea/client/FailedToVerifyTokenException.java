package org.kainos.ea.client;

public class FailedToVerifyTokenException extends Throwable {
    @Override
    public String getMessage() {
        return "An error occurred and the Token could not be verified.";
    }

}
