package org.acme.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name = "Customers")
public class Customers {

    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    private long customerId;

    @NotEmpty(message = "Du måste skriva något")
    private String fName;
    @NotEmpty(message = "Du måste skriva något")
    private String lName;
    @NotEmpty(message = "Du måste skriva något")
    private String email;
    @NotEmpty(message = "Du måste skriva något")
    private String phoneNr;
    /* private String adress; */

    public long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(long customerId) {
        this.customerId = customerId;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNr() {
        return phoneNr;
    }

    public void setPhoneNr(String phoneNr) {
        this.phoneNr = phoneNr;
    }

   /*  public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    } */
}
