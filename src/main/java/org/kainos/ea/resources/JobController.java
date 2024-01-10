package org.kainos.ea.resources;

import io.swagger.annotations.Api;
import org.kainos.ea.api.JobService;
import org.kainos.ea.cli.JobRequest;
import org.kainos.ea.client.*;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


@Api("Job Role API")
@Path("/api")
public class JobController {
    private JobService jobService = new JobService();

    @GET
    @Path("/job-specification/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getJobSpecById(@PathParam("id") int id) {
        try {
            return Response.ok(jobService.getJobSpecById(id)).build();

        } catch (FailedToGetJobSpecException e) {
            System.err.println(e.getMessage());

            return Response.serverError().build();

        } catch (JobSpecDoesNotExistException e) {
            System.err.println(e.getMessage());

            return Response.status(Response.Status.BAD_REQUEST).build();
        }
    }
    @GET
    @Path("/job-roles")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllJobs() {
        try {
            return Response.ok(jobService.getAllJobs()).build();
        } catch (FailedToGetAllJobsException e) {
            System.err.println(e.getMessage());

            return Response.serverError().build();
        }
    }

    @PUT
    @Path("/edit-job-role/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response updateJob(@PathParam("id") int id, JobRequest job) {
        try {
            jobService.updateJob(id, job);

            return Response.ok().build();
        } catch (InvalidJobException | JobDoesNotExistException e) {
            System.err.println(e.getMessage());

            return Response.status(Response.Status.BAD_REQUEST).entity(e.getMessage()).build();
        } catch (FailedToUpdateJobException e) {
            System.err.println(e.getMessage());

            return Response.serverError().build();
        }
    }
}
