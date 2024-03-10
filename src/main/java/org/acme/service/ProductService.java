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

    public void addToCart(Long productId) {
        Product product = findProduct(productId);

        cart.add(product);
    }

    public List<Product> getCart() {
        return cart;
    }

    @Transactional(Transactional.TxType.REQUIRED)
    public void removeProductFromCart(Long productId) {
        cart.removeIf(product -> product.getProductId() == productId);
    }

    public void increaseQuantity(long productId) {
        for (Product product : cart) {
            if (product.getProductId() == productId) {
                product.setQuantity(product.getQuantity() + 1);
                break;
            }
        }
    }

    public void decreaseQuantity(long productId) {
        for (Product product : cart) {
            if (product.getProductId() == productId) {
                product.setQuantity(Math.max(0, product.getQuantity() - 1));

                if (product.getQuantity() == 0) {
                    cart.removeIf(productInCart -> product.getProductId() == productId);
                }
                break;
            }
        }
    }
}