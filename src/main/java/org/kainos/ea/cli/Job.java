package org.kainos.ea.cli;

public class Job {
    private int roleID;
    private String roleName;
    private String capabilityName;

    public Job( int roleID, String roleName, String capabilityName) {
        this.roleID = roleID;
        this.roleName = roleName;
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

    public String getCapabilityName() { return capabilityName; }

    public void setCapabilityName(String capabilityName) {this.capabilityName = capabilityName;}
}

