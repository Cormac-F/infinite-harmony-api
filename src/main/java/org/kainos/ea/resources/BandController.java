package org.kainos.ea.resources;


import io.swagger.annotations.Api;
import org.kainos.ea.api.BandService;
import org.kainos.ea.client.FailedToGetBandException;
import org.kainos.ea.client.FailedToGetBandsException;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Api("Band Level API")
@Path("/api")
public class BandController {
    private BandService bandService = new BandService();

    @GET
    @Path("/band-levels")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllBands() {
        try {
            return Response.ok(bandService.getBands()).build();
        } catch (FailedToGetBandsException e) {
            System.err.println(e.getMessage());

            return Response.serverError().build();
        }
    }

    @GET
    @Path("/band-level/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getBandByID(@PathParam("id") int id) {
        try {
            return Response.ok(bandService.getBandByID(id)).build();
        } catch (FailedToGetBandException e) {
            System.err.println(e.getMessage());

            return Response.serverError().build();
        }
    }

}
