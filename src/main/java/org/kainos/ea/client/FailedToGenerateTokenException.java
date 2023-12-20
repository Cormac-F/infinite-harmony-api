package org.kainos.ea.client;

public class FailedToGenerateTokenException extends Throwable {
    @Override
    public String getMessage() {
        return "An error occurred and the Token was not generated.";
    }
}
