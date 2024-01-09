package org.kainos.ea.service;

import io.dropwizard.auth.Auth;
import org.checkerframework.checker.units.qual.A;
import org.kainos.ea.client.FailedToGetAllJobsException;
import org.kainos.ea.client.FailedToGetJobSpecException;
import org.kainos.ea.client.JobSpecDoesNotExistException;
import org.kainos.ea.cli.Job;
import org.kainos.ea.resources.JobController;
import org.kainos.ea.db.JobDao;
import org.kainos.ea.db.DatabaseConnector;
import org.kainos.ea.api.JobService;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.ea.db.DatabaseConnector;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.InjectMocks;
import org.mockito.Mock;

import java.sql.Array;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;


@ExtendWith(MockitoExtension.class)
public class JobServiceTest {
    private JobDao jobDao = Mockito.mock(JobDao.class);
    @Mock
    private JobController jobController;
    @Mock
    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);

    private JobService jobService = new JobService(jobDao, databaseConnector);

    @Mock
    Connection conn;
    Job testJob = new Job(1, "TestJob", "Band", "Capability");
    static final int ID = 1;


    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }


    @Test
    void jobServiceShouldReturnListWhenCalled() throws FailedToGetAllJobsException, SQLException {
        List<Job> jobList = Arrays.asList(
                Mockito.mock(Job.class),
                Mockito.mock(Job.class)
        );
        Mockito.when(jobDao.getAllJobs()).thenReturn(jobList);
        assertEquals(jobList, jobService.getAllJobs());
    }

    @Test
    void jobServiceShouldReturnJobWhenIDValid() throws FailedToGetJobSpecException, JobSpecDoesNotExistException, SQLException {
        Mockito.when(jobDao.getJobSpecById(1)).thenReturn(testJob);
        assertEquals(jobService.getJobSpecById(1), testJob);
    }

    @Test
    void jobServiceShouldThrowFailedAllJobsWhenSQLExcept() throws FailedToGetAllJobsException, SQLException {
        Mockito.when(jobDao.getAllJobs()).thenThrow(SQLException.class);
        assertThrows(FailedToGetAllJobsException.class,
                () -> jobService.getAllJobs());
    }

    @Test
    void jobServiceShouldThrowSpecNotExistWhenSQLExcept() throws SQLException, JobSpecDoesNotExistException {
        Mockito.when(jobDao.getJobSpecById(0)).thenReturn(null);
        assertThrows(JobSpecDoesNotExistException.class,
                () -> jobService.getJobSpecById(0));
    }




}

