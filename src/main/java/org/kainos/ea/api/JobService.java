package org.kainos.ea.api;

import org.kainos.ea.cli.Job;
import org.kainos.ea.client.FailedToGetAllJobsException;
import org.kainos.ea.db.JobDao;

import java.sql.SQLException;
import java.util.List;

public class JobService {
    private final JobDao jobDao = new JobDao();

    public List<Job> getAllJobs() throws FailedToGetAllJobsException {
        List<Job> jobList;
        try {
            jobList = jobDao.getAllJobs();
        } catch (SQLException e) {
            System.err.println(e.getMessage());

            throw new FailedToGetAllJobsException();
        }

        return jobList;
    }
}
