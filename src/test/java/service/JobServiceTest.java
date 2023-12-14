package service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import javax.ws.rs.core.Response;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.kainos.ea.api.JobService;
import org.kainos.ea.client.FailedToGetAllJobsException;
import org.kainos.ea.resources.JobController;

class JobControllerTest {

    @Mock
    private JobService jobService;

    @InjectMocks
    private JobController jobController;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testGetAllJobsFailedToGetAllJobs() throws FailedToGetAllJobsException {
        // Arrange
        when(jobService.getAllJobs()).thenThrow(new FailedToGetAllJobsException());

        // Act
        Response response = jobController.getAllJobs();

        // Assert
        assertEquals(500, response.getStatus());
    }
}

