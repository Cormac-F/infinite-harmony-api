package org.kainos.ea.client;

public class FailedToGetRoleResponsibilityException extends Throwable {
    @Override
    public String getMessage() {

        return "Failed to get role responsibilities from the database";
    }
}
