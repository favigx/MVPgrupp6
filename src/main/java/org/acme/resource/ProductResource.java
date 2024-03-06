package org.acme.resource;

import java.util.ArrayList;
import java.util.List;

// import org.acme.config.StripeConfig;
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
import com.stripe.param.checkout.SessionCreateParams.PaymentMethodType; // Add this import statement

@Path("/api/product")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class ProductResource {

    @Inject
    ProductService productService;

    @Inject
    Product product;

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
    @Path("/addtocart/{productId}")
    public Response addToCart(@PathParam("productId") Long productId) {
        productService.addToCart(productId);
        return Response.ok("").build();
    }

    @GET
    @Path("/cart")
    public Response getCart() {
        List<Product> cartProducts = productService.getCart();

        if (cartProducts.isEmpty()) {
            return Response.noContent().build();
        }

        return Response.ok(cartProducts).build();
    }

    @POST
    @Path("/createcheckoutsession/{productId}")
    public Response createCheckoutSession(@PathParam("productId") Long productId) {
        Product product = productService.findProduct(productId);
        String productName = product.getProductName();
        Long productPrice = (long) (product.getPrice() * 100);

        Stripe.apiKey = "sk_test_51OqbvuEzGJNrPDWMELPy9umHiLxHrHT0dUCE4CxjrhmrG52MrmZK6MXOSFgCooLQsKuAsvbbLgn4wbL0uhpGmXAb00hdmx6bsQ";

        List<SessionCreateParams.LineItem> lineItems = new ArrayList<>();
        lineItems.add(
            SessionCreateParams.LineItem.builder()
                .setQuantity(1L)
                .setPriceData(
                    SessionCreateParams.LineItem.PriceData.builder()
                        .setCurrency("sek")
                        .setUnitAmount(productPrice)
                        .setProductData(
                            SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                .setName(productName)
                                .build())
                        .build())
                .build()
        );
    
                SessionCreateParams params =
                    SessionCreateParams.builder()
                        .setSuccessUrl("https://example.com/success")
                        .setCancelUrl("https://example.com/cancel")
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

    @GET
    @Path("/key")
    public String getKey() {
        return stripeKey;
    }
}