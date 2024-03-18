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
        return em.createQuery("SELECT p FROM Product p", Product.class).getResultList();
    }

    public Product findProduct(Long productId) {
        Product product = em.find(Product.class, productId);

        if (product == null) {
            throw new NotFoundException("Finns inga robot med angivet id");
        }
        return product;
    }

    public List<Product> findbyCategory(String category) {
        return em.createQuery("SELECT p FROM Product p WHERE p.category = :category", Product.class)
                .setParameter("category", category)
                .getResultList();
    }

    public List<Product> getCart() {
        return cart;
    }   

    public void clearCart() {
        cart.clear();
    }
}