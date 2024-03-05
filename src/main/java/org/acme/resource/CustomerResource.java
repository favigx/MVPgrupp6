package org.acme.resource;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import org.acme.model.Customers;
import org.acme.service.CustomerService;

import com.stripe.exception.StripeException;
import com.stripe.model.Customer;
import com.stripe.net.RequestOptions;
import com.stripe.param.CustomerCreateParams;

import jakarta.inject.Inject;
import jakarta.validation.Valid;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.HeaderParam;
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
    public Response createCustomer(@Valid Customers customer, @HeaderParam("apiKey") String apiKey) throws URISyntaxException, StripeException {
        customer = customerService.createCustomer(customer);
        String customerIdString = String.valueOf(customer.getCustomerId());
        CustomerCreateParams params = CustomerCreateParams.builder()
                .setEmail(customer.getEmail())
                .setName(customer.getfName())
                .build();
                RequestOptions requestOptions = RequestOptions.builder().setApiKey(apiKey).build();
        Customer.create(params, requestOptions);
        URI createdUri = new URI(customerIdString);
        return Response.created(createdUri).entity(customer).build();
    }

    @GET
    public Response getAllCustomers() {
        List<Customers> customers = customerService.findAll();

        if (customers.isEmpty()) {
            return Response.noContent().build();
        }
        return Response.ok(customers).build();
    }
}

