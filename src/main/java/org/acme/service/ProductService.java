package org.acme.service;

import java.util.ArrayList;
import java.util.List;

import org.acme.model.Product;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;
import jakarta.ws.rs.NotFoundException;

@Transactional(Transactional.TxType.SUPPORTS)
@ApplicationScoped
@Named
public class ProductService {

    @Inject
    EntityManager em;

    private List<Product> cart = new ArrayList<>();

    public List<Product> findAll() {
        List<Product> products = em.createQuery("SELECT p FROM Product p", Product.class).getResultList();
        return products;
    }

    public Product findProduct(Long productId) {
        Product product = em.find(Product.class, productId);

        if (product == null) {
            throw new NotFoundException("Finns inga robot med angivet id");
        }
        return product;
    }

    public void addToCart(Long productId) {
        Product product = findProduct(productId);

        cart.add(product);
    }

    public List<Product> getCart() {
        return cart;
    }
}
