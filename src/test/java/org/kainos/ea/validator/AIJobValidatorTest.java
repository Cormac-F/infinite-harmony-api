package org.kainos.ea.validator;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.kainos.ea.cli.JobRequest;
import org.kainos.ea.core.JobValidator;
import org.mockito.Mockito;

public class AIJobValidatorTest {

    private JobValidator jobValidator;

    @BeforeEach
    public void setup() {
        jobValidator = new JobValidator();
    }

    @Test
    public void testIsValidJobInvalidRoleName() {
        // Arrange
        String roleName = "This is a very long role name that exceeds the maximum length allowed";

        // Act
        String result = jobValidator.isValidJob(createMockJobRequest(roleName, 1, 1, "Summary", "Link", 1));

        // Assert
        Assertions.assertEquals("Role Name cannot be more than 50 characters.", result);
    }

    @Test
    public void testIsValidJobInvalidBandID() {
        // Arrange
        int bandID = 0;

        // Act
        String result = jobValidator.isValidJob(createMockJobRequest("Role", bandID, 1, "Summary", "Link", 1));

        // Assert
        Assertions.assertEquals("BandID must be greater than 0", result);
    }

    @Test
    public void testIsValidJobInvalidFamilyID() {
        // Arrange
        int familyID = 0;

        // Act
        String result = jobValidator.isValidJob(createMockJobRequest("Role", 1, familyID, "Summary", "Link", 1));

        // Assert
        Assertions.assertEquals("FamilyID must be greater than 0", result);
    }

    @Test
    public void testIsValidJobInvalidSpecSummary() {
        // Arrange
        String specSummary = "This is a very long spec summary that exceeds the maximum length allowed. This is a very long spec summary that exceeds the maximum length allowed. This is a very long spec summary that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed.This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed.This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed.This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed.";

        // Act
        String result = jobValidator.isValidJob(createMockJobRequest("Role", 1, 1, specSummary, "Link", 1));

        // Assert
        Assertions.assertEquals("SpecSummary cannot be more than 900 characters", result);
    }

    @Test
    public void testIsValidJobInvalidSharepointLink() {
        // Arrange
        String sharepointLink = "This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed.This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed.This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed.This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed. This is a very long sharepoint link that exceeds the maximum length allowed.";

        // Act
        String result = jobValidator.isValidJob(createMockJobRequest("Role", 1, 1, "Summary", sharepointLink, 1));

        // Assert
        Assertions.assertEquals("Sharepoint Link cannot be more than 900 characters", result);
    }

    @Test
    public void testIsValidJobInvalidResponsibilityID() {
        // Arrange
        int responsibilityID = 0;

        // Act
        String result = jobValidator.isValidJob(createMockJobRequest("Role", 1, 1, "Summary", "Link", responsibilityID));

        // Assert
        Assertions.assertEquals("ResponsibilityID must be greater than 0", result);
    }

    // Helper method to create a mocked JobRequest object
    private JobRequest createMockJobRequest(String roleName, int bandID, int familyID, String specSummary, String sharepointLink, int responsibilityID) {
        JobRequest jobRequest = Mockito.mock(JobRequest.class);
        Mockito.when(jobRequest.getRoleName()).thenReturn(roleName);
        Mockito.when(jobRequest.getBandID()).thenReturn(bandID);
        Mockito.when(jobRequest.getFamilyID()).thenReturn(familyID);
        Mockito.when(jobRequest.getSpecSummary()).thenReturn(specSummary);
        Mockito.when(jobRequest.getSharepointLink()).thenReturn(sharepointLink);
        Mockito.when(jobRequest.getResponsibilityID()).thenReturn(responsibilityID);
        return jobRequest;
    }
}
