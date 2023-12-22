package org.kainos.ea.cli;

public class Job {
    private int roleID;
    private String roleName;
    private String bandName;
    private String capabilityName;
    private String specSummary;
    private String sharepointLink;

    public Job(int roleID, String roleName, String bandName, String capabilityName) {
        this.roleID = roleID;
        this.roleName = roleName;
        this.bandName = bandName;
        this.capabilityName = capabilityName;
    }
    public Job(String roleName, int roleID, String specSummary, String sharepointLink) {
        this.roleID = roleID;
        this.roleName = roleName;
        this.specSummary = specSummary;
        this.sharepointLink = sharepointLink;
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

    public String getBandName() {
        return bandName;
    }

    public void setBandName(String bandName) {
        this.bandName = bandName;
    }

    public String getCapabilityName() {
        return capabilityName;
    }

    public void setCapabilityName(String capabilityName) {
        this.capabilityName = capabilityName;
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

