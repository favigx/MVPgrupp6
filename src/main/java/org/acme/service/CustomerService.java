package org.acme.service;

import java.util.List;

import org.acme.model.Customers;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;

@Transactional(Transactional.TxType.SUPPORTS)
@ApplicationScoped
@Named
public class CustomerService {

    @Inject
    EntityManager em;

    @Transactional(Transactional.TxType.REQUIRED)
    public Customers createCustomer(Customers customer) {
        em.persist(customer);
        return customer;
    }

    public List<Customers> findAll() {
        List<Customers> customers = em.createQuery("SELECT c FROM Customers c", Customers.class).getResultList();
        return customers;
    }
}