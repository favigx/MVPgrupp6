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
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.NotFoundException;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
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

    @DELETE
    @Path("/remove/{productId}")
    public Response removeProductFromCart(@PathParam("productId") Long productId) {
        try {
            productService.removeProductFromCart(productId);
            return Response.noContent().build();
        } catch (NotFoundException e) {
            return Response.status(Response.Status.NOT_FOUND).entity("Finns inga robotar med det ID").build();
        }
    }

    @GET
    @Path("/clearcart")
    public Response clearCart() {
        productService.clearCart();
        return Response.ok("").build();
    }

    @PUT
    @Path("increase/{productId}")
    public Response increaseQuantity(@PathParam("productId") Long productId) {

        productService.increaseQuantity(productId);
        return Response.ok("").build();
    }

    @PUT
    @Path("decrease/{productId}")
    public Response decreaseQuantity(@PathParam("productId") Long productId) {

        productService.decreaseQuantity(productId);
        return Response.ok("").build();
    }

    @POST
    @Path("/createcheckoutsession")
    public Response createCheckoutSession() {
        List<Product> cartProducts = productService.getCart();

        Stripe.apiKey = stripeKey;

        if (cartProducts.isEmpty()) {
            return Response.noContent().build();
        }

        List<SessionCreateParams.LineItem> lineItems = new ArrayList<>();

        for (Product product : cartProducts) {
            String productName = product.getProductName();
            Long productPrice = (long) (product.getPrice() * 100);
            Long productQuantity = product.getQuantity();
            lineItems.add(
                    SessionCreateParams.LineItem.builder()
                            .setQuantity(productQuantity)
                            .setPriceData(
                                    SessionCreateParams.LineItem.PriceData.builder()
                                            .setCurrency("sek")
                                            .setUnitAmount(productPrice)
                                            .setProductData(
                                                    SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                                            .setName(productName)
                                                            .build())
                                            .build())
                            .build());
        }

        SessionCreateParams params = SessionCreateParams.builder()
                .setSuccessUrl("http://127.0.0.1:5500/success.html")
                .setCancelUrl("http://127.0.0.1:5500/cancel.html")
                .addPaymentMethodType(PaymentMethodType.CARD)
                .setMode(SessionCreateParams.Mode.PAYMENT)
                .addAllLineItem(lineItems)
                .build();

        try {
            Session session = Session.create(params);
            // productService.clearCart();
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