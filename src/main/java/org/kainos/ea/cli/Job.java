package org.kainos.ea.cli;

public class Job {
    private int roleID;
    private String roleName;
    private int BandID;
    private int familyID;
    private String specSummary;
    private String sharepointLink;

    public Job(int roleID, String roleName, int bandID, int familyID, String specSummary, String sharepointLink) {
        this.roleID = roleID;
        this.roleName = roleName;
        BandID = bandID;
        this.familyID = familyID;
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

    public int getBandID() {
        return BandID;
    }

    public void setBandID(int bandID) {
        BandID = bandID;
    }

    public int getFamilyID() {
        return familyID;
    }

    public void setFamilyID(int familyID) {
        this.familyID = familyID;
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
