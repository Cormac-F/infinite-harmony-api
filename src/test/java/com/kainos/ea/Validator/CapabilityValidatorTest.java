package com.kainos.ea.Validator;

import org.junit.jupiter.api.Test;
import org.kainos.ea.cli.CapabilityRequest;
import org.kainos.ea.client.CapabilityValidator;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class CapabilityValidatorTest {
    CapabilityValidator capabilityValidator = new CapabilityValidator();

    @Test
    public void isValidCapabilityNameshouldReturnTruewhenValidName() {
        CapabilityRequest capabilityRequest = new CapabilityRequest(
                "People"
        );

        assertTrue(capabilityValidator.isValidCapabiility(capabilityRequest));
    }
    @Test
    public void isValidCapabilityshouldReturnFalsewhenValidName() {
        CapabilityRequest capabilityRequest = new CapabilityRequest(
                "OneHundredCharactersMcdvcjvjvchvusvhcujhcdvcjhdvcjhdvcjhdsvcgdvchvdhgvdjgcdjhcvhdj"
                        + "djbdbcbcbdhbbbjbchdchjdvjhvdjhvfjhfqwertyuiosdfghjkzxcvbnmwertyusdfghwertysdfghchbccbdh"

        );

        assertFalse(capabilityValidator.isValidCapabiility(capabilityRequest));
    }
}
