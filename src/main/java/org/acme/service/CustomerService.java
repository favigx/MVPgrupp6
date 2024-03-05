package org.acme.service;

import org.acme.model.Customer;

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
    public Customer createCustomer(Customer customer) {
        em.persist(customer);
        return customer;

    }

}
