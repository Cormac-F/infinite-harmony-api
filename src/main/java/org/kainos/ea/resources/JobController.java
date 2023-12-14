package org.kainos.ea.resources;

import io.swagger.annotations.Api;
import org.kainos.ea.api.JobService;
import org.kainos.ea.client.FailedToGetAllJobsException;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Api("Job Role API")
@Path("/api")
public class JobController {
    private final JobService jobService = new JobService();

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



}
