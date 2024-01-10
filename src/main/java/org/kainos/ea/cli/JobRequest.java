package org.kainos.ea.cli;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class JobRequest {
    private String roleName;
    private int bandID; // update band associated with role
    private int familyID; // updates capability associated with role
    private String specSummary;
    private String sharepointLink;
    private int responsibilityID; // updated responsibilities for role


    public int getResponsibilityID() {
        return responsibilityID;
    }

    public void setResponsibilityID(int responsibilityID) {
        this.responsibilityID = responsibilityID;
    }


    public int getFamilyID() {
        return familyID;
    }

    public void setFamilyID(int familyID) {
        this.familyID = familyID;
    }


    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public int getBandID() {
        return bandID;
    }

    public void setBandID(int bandID) {
        this.bandID = bandID;
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

    @JsonCreator
    public JobRequest(
            @JsonProperty("roleName") String roleName,
            @JsonProperty("bandID") int bandID,
            @JsonProperty("familyID") int familyID,
            @JsonProperty("specSummary") String specSummary,
            @JsonProperty("sharepointLink") String sharepointLink,
            @JsonProperty("responsibilityID") int responsibilityID) {
                this.roleName = roleName;
                this.bandID = bandID;
                this.familyID = familyID;
                this.specSummary = specSummary;
                this.sharepointLink = sharepointLink;
                this.responsibilityID = responsibilityID;
    }
}
