package org.kainos.ea.cli;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class CapabilityRequest {
    private String capabilityName;

    public String getCapabilityName() {
        return capabilityName;
    }

    public void setCapabilityName(String capabilityName) {
        this.capabilityName = capabilityName;
    }

    @JsonCreator
    public CapabilityRequest(
            @JsonProperty("capabilityName") String capabilityName) {
        this.capabilityName = capabilityName;
    }
}
