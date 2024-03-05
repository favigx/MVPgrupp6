package org.acme.resource;

import java.net.URI;
import java.net.URISyntaxException;

import org.acme.model.Customer;
import org.acme.service.CustomerService;

import jakarta.inject.Inject;
import jakarta.validation.Valid;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/api/customer")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class CustomerResource {

    @Inject
    CustomerService customerService;

    @POST
    public Response createCustomer(@Valid Customer customer) throws URISyntaxException {
        customer = customerService.createCustomer(customer);
        URI createdUri = new URI(customer.getCustomerId().toString());
        return Response.created(createdUri).entity(customer).build();
    }

}
