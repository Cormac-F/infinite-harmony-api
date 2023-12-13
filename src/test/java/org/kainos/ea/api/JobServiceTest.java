package org.kainos.ea.api;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.kainos.ea.cli.Job;
import org.kainos.ea.client.FailedToGetAllJobsException;
import org.kainos.ea.db.DatabaseConnector;
import org.kainos.ea.db.JobDao;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertIterableEquals;


@ExtendWith(MockitoExtension.class)
class JobServiceTest {

    JobDao jobDao = Mockito.mock(JobDao.class);
    DatabaseConnector databaseConnector = Mockito.mock(DatabaseConnector.class);
    JobService jobService = new JobService();
    Connection conn;

    // When dao returns a list of jobs
    // expect the list of jobs to be returned

    @Test
    void getAllJobs_shouldReturnJobs_whenDaoReturnsJobs() throws SQLException, FailedToGetAllJobsException {
        List<Job> ListofJobs = Arrays.asList(
                Mockito.mock(Job.class),
                Mockito.mock(Job.class),
                Mockito.mock(Job.class),
                Mockito.mock(Job.class)
        );
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(jobDao.getAllJobs()).thenReturn(ListofJobs);
        assertEquals(ListofJobs, jobService.getAllJobs());
    }

    @Test
    void getAllJobs_shouldThrowSqlException_whenDaoThrowsSqlException() throws SQLException {
        Mockito.when(databaseConnector.getConnection()).thenReturn(conn);
        Mockito.when(jobDao.getAllJobs()).thenThrow(SQLException.class);

        assertThrows(SQLException.class,
                () -> jobService.getAllJobs());
    }
}
