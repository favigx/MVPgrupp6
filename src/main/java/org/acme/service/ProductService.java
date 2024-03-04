package org.acme.service;

import java.util.List;

import org.acme.model.Product;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;

@Transactional(Transactional.TxType.SUPPORTS)
@ApplicationScoped
@Named
public class ProductService {

    @Inject
    EntityManager em;

    public List<Product> findAll() {
        List<Product> products = em.createQuery("SELECT p FROM Product p", Product.class).getResultList();
        return products;
    }
}
