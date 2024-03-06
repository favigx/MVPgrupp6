
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

    create table OrderProduct (
        quantity integer not null,
        orderId bigint not null,
        orderProductId bigserial not null,
        productId bigint not null,
        primary key (orderProductId)
    );

    create table Product (
        price float(53) not null,
        productId bigserial not null,
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
insert into Product (productName, price, category, imgUrl) values ('Gary', '76.9', 'Städ', 'https://robohash.org/etasperioresrerum.png?size=50x50&set=set1');
insert into Product (productName, price, category, imgUrl) values ('Kipp', '921', 'Läx', 'https://robohash.org/liberoassumendamolestiae.png?size=50x50&set=set1');
insert into Product (productName, price, category, imgUrl) values ('Indira', '039', 'Läx', 'https://robohash.org/temporibusreprehenderitipsam.png?size=50x50&set=set1');
insert into Product (productName, price, category, imgUrl) values ('Levi', '766', 'Städ', 'https://robohash.org/estnondeserunt.png?size=50x50&set=set1');
insert into Product (productName, price, category, imgUrl) values ('Tye', '557', 'Hjälpreda', 'https://robohash.org/nesciuntrerumeos.png?size=50x50&set=set1');
insert into Product (productName, price, category, imgUrl) values ('Bailey', '338', 'Hjälpreda', 'https://robohash.org/eosconsecteturvoluptate.png?size=50x50&set=set1');
insert into Product (productName, price, category, imgUrl) values ('Halette', '587', 'Hjälpreda', 'https://robohash.org/perferendisnihilnulla.png?size=50x50&set=set1');
insert into Product (productName, price, category, imgUrl) values ('Vinny', '916', 'Musik', 'https://robohash.org/voluptasquibusdamperspiciatis.png?size=50x50&set=set1');
insert into Product (productName, price, category, imgUrl) values ('Dayna', '334', 'Musik', 'https://robohash.org/quinumquamet.png?size=50x50&set=set1');
insert into Product (productName, price, category, imgUrl) values ('Denice', '517', 'Musik', 'https://robohash.org/enimautenim.png?size=50x50&set=set1');
