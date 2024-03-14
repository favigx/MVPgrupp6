
    create table Customers (
        customerId bigserial not null,
        email varchar(255),
        fName varchar(255),
        lName varchar(255),
        phoneNr varchar(255),
        primary key (customerId)
    );

    create table Order (
        totalPrice float(53) not null,
        customerId bigint not null,
        dateTime timestamp(6),
        orderId bigserial not null,
        primary key (orderId)
    );

    create table Product (
        price float(53) not null,
        productId bigserial not null,
        quantity bigint,
        category varchar(255),
        imgUrl varchar(255),
        productName varchar(255),
        primary key (productId)
    );
insert into Customers (fName, lName, email, phoneNr) values ('Magnum', 'Antoniutti', 'mantoniutti0@jalbum.net', '526-795-9831');
insert into Customers (fName, lName, email, phoneNr) values ('Hedwiga', 'Andreone', 'handreone1@google.nl', '870-132-2088');
insert into Customers (fName, lName, email, phoneNr) values ('Wendeline', 'Towne', 'wtowne2@123-reg.co.uk', '105-483-9697');
insert into Customers (fName, lName, email, phoneNr) values ('Ofilia', 'Carnow', 'ocarnow3@google.com.hk', '846-735-2824');
insert into Customers (fName, lName, email, phoneNr) values ('Daloris', 'Crowth', 'dcrowth4@constantcontact.com', '160-427-4738');
insert into Customers (fName, lName, email, phoneNr) values ('Ezmeralda', 'Charrette', 'echarrette5@geocities.com', '477-515-5115');
insert into Customers (fName, lName, email, phoneNr) values ('Kippar', 'Schwandermann', 'kschwandermann6@paginegialle.it', '911-728-6324');
insert into Customers (fName, lName, email, phoneNr) values ('Mallorie', 'Southernwood', 'msouthernwood7@shutterfly.com', '698-688-8165');
insert into Customers (fName, lName, email, phoneNr) values ('Saunderson', 'Arendt', 'sarendt8@bloglines.com', '880-837-0076');
insert into Customers (fName, lName, email, phoneNr) values ('Katharyn', 'Mulvany', 'kmulvany9@bravesites.com', '597-787-3490');
insert into Product (productName, price, quantity, category, imgUrl) values ('Basic', '1000', '1', 'Smarthem', 'https://cdna.artstation.com/p/assets/images/images/012/553/052/large/hannah-mccall-pose-0.jpg?1535378997');
insert into Product (productName, price, quantity, category, imgUrl) values ('Luke', '3000', '1', 'Smarthem+', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F26%2F1b%2F06%2F261b06a14ebabb0b345ae23920a998ca.jpg&f=1&nofb=1&ipt=f161a907feff5a9c77266b6f34fb08ba6363bfcd6032c375e720defb63802840&ipo=images');
insert into Product (productName, price, quantity, category, imgUrl) values ('Jess', '3000', '1', 'Smarthem+', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstudiousguy.com%2Fwp-content%2Fuploads%2F2020%2F11%2FRobots.jpg&f=1&nofb=1&ipt=7a92043ab15c7b1b8f85b62b8ba9fc228f841604e9010b1047784c392142a135&ipo=images');
insert into Product (productName, price, quantity, category, imgUrl) values ('Leia', '10000', '1', 'Hemhjälp', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.explicit.bing.net%2Fth%3Fid%3DOIP.2yGJbkQWtBxdW3EV10BQ7QHaHZ%26pid%3DApi&f=1&ipt=0b180d282c9584ba87fc7d50a11a9c8af45bfdf34882e977e662a5a57327890c&ipo=images');
insert into Product (productName, price, quantity, category, imgUrl) values ('Steve', '10000', '1', 'Avancerad', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.8q6fs5WGC8a2WfVDSsp-TgHaHa%26pid%3DApi&f=1&ipt=79f53db0448d5fa8f87dfdbd6add42a881c4530da1951d4b7ffbcbabeca09d4f&ipo=images');
insert into Product (productName, price, quantity, category, imgUrl) values ('Roger', '100000', '1', 'Avancerad', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.I8OdVdjwlV7A8Zag6QWciQHaHZ%26pid%3DApi&f=1&ipt=1189b63e284311cc737e8b25982f4524f4f8cebaa064bf683aca953299d1838c&ipo=images');
