package org.kainos.ea.core;

import org.kainos.ea.cli.JobRequest;

public class JobValidator {
    private static final int MAX_NAME_LENGTH = 50;
    private static final int MAX_LENGTH = 900;
    public String isValidJob(JobRequest ser) {
        if (ser.getRoleName().length() > MAX_NAME_LENGTH) {
            return "Role Name cannot be more than 50 characters.";
        }
        if (ser.getBandID() <= 0) {
            return "BandID must be greater than 0";
        }
        if (ser.getFamilyID() <= 0) {
            return "FamilyID must be greater than 0";
        }
        if (ser.getSpecSummary().length() > MAX_LENGTH) {
            return "SpecSummary cannot be more than 900 characters";
        }
        if (ser.getSharepointLink().length() > MAX_LENGTH) {
            return "Sharepoint Link cannot be more than 900 characters";
        }
        if (ser.getResponsibilityID() <= 0) {
            return "ResponsibilityID must be greater than 0";
        }
        return null;
    }
}
