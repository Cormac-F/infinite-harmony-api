package org.kainos.ea.client;

public class TokenExpiredException extends Throwable {
    @Override
    public String getMessage() {
        return "The token has expired. Please sign in again.";
    }
}
