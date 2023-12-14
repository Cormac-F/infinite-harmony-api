package service;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.ea.api.JobService;
import org.kainos.ea.cli.Job;
import org.kainos.ea.client.FailedToGetAllJobsException;

import org.kainos.ea.db.JobDao;
import org.mockito.InjectMocks;
import org.mockito.Mock;

import org.mockito.junit.jupiter.MockitoExtension;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class JobServiceTest {

    @Mock
    private JobDao jobDao;

    @InjectMocks
    private JobService jobService;

    @Test
    void ShouldReturnListOfAllJobs() throws SQLException, FailedToGetAllJobsException {
        List<Job> jobs = new ArrayList<>();
        when(jobDao.getAllJobs()).thenReturn(jobs);

        assertEquals(jobs, jobService.getAllJobs());
    }
}

