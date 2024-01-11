package org.kainos.ea.resources;

import io.swagger.annotations.Api;
import org.kainos.ea.api.ResponsibilityService;
import org.kainos.ea.client.FailedToGetRoleResponsibilityException;
import org.kainos.ea.client.RoleResponsibilityDoesNotExistException;
import org.kainos.ea.db.ResponsibilityDao;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


@Api("Responsibilities API")
@Path("/api")
public class ResponsibilityController {

    private ResponsibilityDao responsibilityDao = new ResponsibilityDao();
    private ResponsibilityService responsibilityService = new ResponsibilityService(responsibilityDao);

    @GET
    @Path("/responsibilities-per-role/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getRoleResponsibilityById(@PathParam("id") int id) {
        try {
            return Response.ok(responsibilityService.getRoleResponsibilityByRoleId(id)).build();

        } catch (FailedToGetRoleResponsibilityException e) {
            System.err.println(e.getMessage());

            return Response.serverError().build();

        } catch (RoleResponsibilityDoesNotExistException e) {
            System.err.println(e.getMessage());
                return Response.status(Response.Status.BAD_REQUEST).build();
        }
    }

}
