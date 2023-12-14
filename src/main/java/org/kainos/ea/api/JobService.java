package org.kainos.ea.api;

import org.kainos.ea.cli.Job;
import org.kainos.ea.client.FailedToGetJobSpecException;
import org.kainos.ea.client.FailedToGetAllJobsException;
import org.kainos.ea.client.JobSpecDoesNotExistException;
import org.kainos.ea.db.JobDao;

import java.sql.SQLException;
import java.util.List;


public class JobService {
    private JobDao jobDao = new JobDao();

    public Job getJobSpecById(int id) throws FailedToGetJobSpecException, JobSpecDoesNotExistException {
        try {
            Job job = jobDao.getJobSpecById(id);

            if (job == null) {
                throw new JobSpecDoesNotExistException();
            }

            return job;
        } catch (SQLException e) {
            System.err.println(e.getMessage());

            throw new FailedToGetJobSpecException();
        }
    }


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
