package org.kainos.ea.cli;

public class Job {
    private int roleID;
    private String roleName;

    public Job(int roleID, String roleName) {
        this.roleID = roleID;
        this.roleName = roleName;
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

    private String specSummary;
    private String sharepointLink;


    public Job(int roleID, String roleName, String specSummary, String sharepointLink) {
        this.roleID = roleID;
        this.roleName = roleName;
        this.specSummary = specSummary;
        this.sharepointLink = sharepointLink;
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
