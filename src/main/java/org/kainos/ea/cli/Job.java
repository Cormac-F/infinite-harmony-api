package org.kainos.ea.cli;

public class Job {
    private int roleID;
    private String roleName;
    private int bandID;
    private int familyID;
    private String specSummary;
    private String sharepointLink;
    private String capabilityName;
    private String bandName;

    public Job(int roleID, String roleName, int bandID, int familyID,
               String specSummary, String sharepointLink, String capabilityName, String bandName) {
        this.roleID = roleID;
        this.roleName = roleName;
        this.bandID = bandID;
        this.familyID = familyID;
        this.specSummary = specSummary;
        this.sharepointLink = sharepointLink;
        this.capabilityName = capabilityName;
        this.bandName = bandName;
    }

    public String getBandName() {
        return bandName;
    }

    public void setBandName(String bandName) {
        this.bandName = bandName;
    }

    public int getBandID() {
        return bandID;
    }

    public void setBandID(int bandID) {
        this.bandID = bandID;
    }

    public int getFamilyID() {
        return familyID;
    }

    public void setFamilyID(int familyID) {
        this.familyID = familyID;
    }

    public String getCapabilityName() {
        return capabilityName;
    }

    public void setCapabilityName(String capabilityName) {

        this.capabilityName = capabilityName;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getSpecSummary() {
        return specSummary;
    }

    public void setSpecSummary(String specSummary) {
        this.specSummary = specSummary;
    }

    public String getSharepointLink() {
        return sharepointLink;
    }

    public void setSharepointLink(String sharepointLink) {
        this.sharepointLink = sharepointLink;
    }
}

