package org.kainos.ea.client;

public class RoleResponsibilityDoesNotExistException extends Throwable {
    @Override
    public String getMessage() {

        return "Role responsibility does not exist in the database";
    }
}
