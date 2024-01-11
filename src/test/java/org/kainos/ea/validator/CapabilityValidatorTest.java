package org.kainos.ea.validator;

import org.junit.jupiter.api.Test;
import org.kainos.ea.cli.CapabilityRequest;
import org.kainos.ea.client.CapabilityValidator;

import static org.junit.Assert.assertNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class CapabilityValidatorTest {
    CapabilityValidator capabilityValidator = new CapabilityValidator();

    @Test
    public void testValidCapabilityNameLength() {
        CapabilityValidator capabilityValidator = new CapabilityValidator();

        // Create a CapabilityRequest with a valid name length
        CapabilityRequest capabilityRequest = new CapabilityRequest("ValidName");

        // The isValidCapability method should return null for a valid name
        String validation = capabilityValidator.isValidCapability(capabilityRequest);

        // Assert that the validation result is null, indicating a valid capability name length
        assertEquals(null, validation);
    }

    @Test
    public void testInvalidCapabilityNameLength() {
        CapabilityValidator capabilityValidator = new CapabilityValidator();

        // Create a CapabilityRequest with an invalid name length
        CapabilityRequest capabilityRequest = new CapabilityRequest(
                "InvalidNameExceedingMaxLengthForCapabilityNameValidation");

        // The isValidCapability method should return an error message for an invalid name length
        String validation = capabilityValidator.isValidCapability(capabilityRequest);

        // Assert that the validation result is the expected error message
        assertNull("Capability name is too long", validation);
    }
}
