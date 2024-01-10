package org.kainos.ea.core;

import org.kainos.ea.cli.JobRequest;

public class JobValidator {
    public String isValidJob(JobRequest ser) {
        if(ser.getRoleName().length() > 50 ) {
            return "Role Name cannot be more than 50 characters.";
        }
        if(ser.getBandID() <= 0 ) {
            return "BandID must be greater than 0";
        }
        if(ser.getFamilyID() <= 0 ) {
            return "FamilyID must be greater than 0";
        }
        if(ser.getSpecSummary().length() > 900 ) {
            return "SpecSummary cannot be more than 900 characters";
        }
        if(ser.getSharepointLink().length() > 900 ) {
            return "Sharepoint Link cannot be more than 900 characters";
        }
        if(ser.getResponsibilityID() <= 0) {
            return "ResponsibilityID must be greater than 0";
        }
        return null;
    }
}
