package org.kainos.ea.resources;

import io.swagger.annotations.Api;
import org.checkerframework.checker.units.qual.C;
import org.kainos.ea.api.CapabilityService;
import org.kainos.ea.cli.Capability;
import org.kainos.ea.cli.CapabilityRequest;
import org.kainos.ea.client.*;
import org.kainos.ea.db.CapabilityDao;

import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


@Api("Job Role API")
@Path("/api")
public class CapabilityController {
    private CapabilityDao capabilityDao = new CapabilityDao();
    private CapabilityValidator capabilityValidator = new CapabilityValidator();
    private CapabilityService capabilityService = new CapabilityService(capabilityDao, capabilityValidator);

    @GET
    @Path("/capability")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllCapabilities() {
        try {
            return Response.ok(capabilityService.getAllCapabilities()).build();
        } catch (FailedToGetCapabilitiesException e) {
            System.err.println(e.getMessage());

            return Response.serverError().build();
        }
    }

    @GET
    @Path("/capability/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getCapabilityByID(@PathParam("id") int id) {
        try {
            Capability capability = capabilityService.getCapabilityByID(id);
                if (capability == null) {
                    return Response.status(Response.Status.NOT_FOUND).build();
                }
            return Response.ok().build();
        } catch (FailedToGetCapabilityException | CapabilityDoesNotExistException e) {
            System.err.println(e.getMessage());

            return Response.serverError().build();
        }
    }
    @PUT
    @Path("/capability/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response updateCapability(@PathParam("id") int id, CapabilityRequest capability) {
        try {
            capabilityService.updateCapability(id, capability);

            return Response.ok().build();
        } catch (CapabilityDoesNotExistException | InvalidCapabilityException e) {
            System.err.println(e.getMessage());

            return Response.status(Response.Status.BAD_REQUEST).entity(e.getMessage()).build();

        } catch (FailedToUpdateCapabilityException e) {
            System.err.println(e.getMessage());

            return Response.serverError().build();
        }
    }
}
