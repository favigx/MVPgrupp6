package org.acme.resource;

import java.util.ArrayList;
import java.util.List;

import org.acme.model.Product;
import org.acme.service.ProductService;
import org.eclipse.microprofile.config.inject.ConfigProperty;

import com.stripe.Stripe;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;

import jakarta.inject.Inject;
import jakarta.validation.constraints.Min;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.NotFoundException;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import com.stripe.param.checkout.SessionCreateParams.PaymentMethodType;

@Path("/api/product")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class ProductResource {

    @Inject
    ProductService productService;

    @Inject
    @ConfigProperty(name = "stripe.apiKey")
    String stripeKey;

    @GET
    public Response getProduct() {
        List<Product> products = productService.findAll();

        if (products.isEmpty()) {
            return Response.noContent().build();
        }
        return Response.ok(products).build();
    }

    @GET
    @Path("/category/{category}")
    public Response getProductByCategory(@PathParam("category") String category) {
        try {
            List<Product> products = productService.findbyCategory(category);
            return Response.ok(products).build();
        } catch (NotFoundException e) {
            return Response.status(Response.Status.NOT_FOUND).entity("Finns inga robotar med den kategorin").build();
        }
    }

    @GET
    @Path("/{productId}")
    public Response getProductById(@PathParam("productId") @Min(1) Long productId) {
        try {
            Product product = productService.findProduct(productId);
            return Response.ok(product).build();
        } catch (NotFoundException e) {
            return Response.status(Response.Status.NOT_FOUND).entity("Finns inga robotar med det ID").build();
        }
    }

    @POST
    @Path("/createcheckoutsession")
    public Response createCheckoutSession(List<Product> cartItems) {
        Stripe.apiKey = stripeKey;

        if (cartItems == null || cartItems.isEmpty()) {
            return Response.noContent().build();
        }

        List<SessionCreateParams.LineItem> lineItems = new ArrayList<>();

        for (Product product : cartItems) {
            String productName = product.getProductName();
            Long price = (long) (product.getPrice() * 100);
            Long productQuantity = product.getQuantity();
            lineItems.add(
                    SessionCreateParams.LineItem.builder()
                            .setQuantity(productQuantity)
                            .setPriceData(
                                    SessionCreateParams.LineItem.PriceData.builder()
                                            .setCurrency("sek")
                                            .setUnitAmount(price)
                                            .setProductData(
                                                    SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                                            .setName(productName)
                                                            .build())
                                            .build())
                            .build());
        }

        SessionCreateParams params = SessionCreateParams.builder()
                .setSuccessUrl("http://127.0.0.1:5501/success.html")
                .setCancelUrl("http://127.0.0.1:5501/cancel.html")
                .addPaymentMethodType(PaymentMethodType.CARD)
                .setMode(SessionCreateParams.Mode.PAYMENT)
                .addAllLineItem(lineItems)
                .build();

        try {
            Session session = Session.create(params);
            return Response.ok(session.getUrl()).build();
        } catch (Exception e) {
            return Response.serverError().entity(e.getMessage()).build();
        }
    }
}