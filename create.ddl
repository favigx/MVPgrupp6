
    create table Customer (
        phoneNr integer not null,
        customerId bigserial not null,
        email varchar(255),
        fName varchar(255),
        lName varchar(255),
        password varchar(255),
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
        description varchar(255),
        imgUrl varchar(255),
        productName varchar(255),
        primary key (productId)
    );
insert into Customer (customerId, fName, lname, email, phoneNr, password) values ('1', 'Magnum', 'Antoniutti', 'mantoniutti0@jalbum.net', '526-795-9831', 'zS1#&1JA5Qs');
insert into Customer (customerId, fName, lname, email, phoneNr, password) values ('2', 'Hedwiga', 'Andreone', 'handreone1@google.nl', '870-132-2088', 'sT6>de6`<C');
insert into Customer (customerId, fName, lname, email, phoneNr, password) values ('3', 'Wendeline', 'Towne', 'wtowne2@123-reg.co.uk', '105-483-9697', 'tR2@EofOMk)%uw&');
insert into Customer (customerId, fName, lname, email, phoneNr, password) values ('4', 'Ofilia', 'Carnow', 'ocarnow3@google.com.hk', '846-735-2824', 'eK6*u<Txp0');
insert into Customer (customerId, fName, lname, email, phoneNr, password) values ('5', 'Daloris', 'Crowth', 'dcrowth4@constantcontact.com', '160-427-4738', 'cN2&SeNur%|GF,l.');
insert into Customer (customerId, fName, lname, email, phoneNr, password) values ('6', 'Ezmeralda', 'Charrette', 'echarrette5@geocities.com', '477-515-5115', 'cD7>7Gu1pwwR');
insert into Customer (customerId, fName, lname, email, phoneNr, password) values ('7', 'Kippar', 'Schwandermann', 'kschwandermann6@paginegialle.it', '911-728-6324', 'nL7.J!LIy)2eU`');
insert into Customer (customerId, fName, lname, email, phoneNr, password) values ('8', 'Mallorie', 'Southernwood', 'msouthernwood7@shutterfly.com', '698-688-8165', 'hY3(s<@z_');
insert into Customer (customerId, fName, lname, email, phoneNr, password) values ('9', 'Saunderson', 'Arendt', 'sarendt8@bloglines.com', '880-837-0076', 'tO1|RmOBj3bKk,lJ');
insert into Customer (customerId, fName, lname, email, phoneNr, password) values ('10', 'Katharyn', 'Mulvany', 'kmulvany9@bravesites.com', '597-787-3490', 'jR9!kNc2~"i)%p');
insert into Product (productId, productName, price, description, imgUrl) values ('1', 'Gary', '76.9', 'Hej', 'https://robohash.org/etasperioresrerum.png?size=50x50&set=set1');
insert into Product (productId, productName, price, description, imgUrl) values ('2', 'Kipp', '921', 'Hej', 'https://robohash.org/liberoassumendamolestiae.png?size=50x50&set=set1');
insert into Product (productId, productName, price, description, imgUrl) values ('3', 'Indira', '039', 'Hej', 'https://robohash.org/temporibusreprehenderitipsam.png?size=50x50&set=set1');
insert into Product (productId, productName, price, description, imgUrl) values ('4', 'Levi', '766', 'Hej', 'https://robohash.org/estnondeserunt.png?size=50x50&set=set1');
insert into Product (productId, productName, price, description, imgUrl) values ('5', 'Tye', '557', 'Hej', 'https://robohash.org/nesciuntrerumeos.png?size=50x50&set=set1');
insert into Product (productId, productName, price, description, imgUrl) values ('6', 'Bailey', '338', 'Hej', 'https://robohash.org/eosconsecteturvoluptate.png?size=50x50&set=set1');
insert into Product (productId, productName, price, description, imgUrl) values ('7', 'Halette', '587', 'Hej', 'https://robohash.org/perferendisnihilnulla.png?size=50x50&set=set1');
insert into Product (productId, productName, price, description, imgUrl) values ('8', 'Vinny', '916', 'Hej', 'https://robohash.org/voluptasquibusdamperspiciatis.png?size=50x50&set=set1');
insert into Product (productId, productName, price, description, imgUrl) values ('9', 'Dayna', '334', 'Hej', 'https://robohash.org/quinumquamet.png?size=50x50&set=set1');
insert into Product (productId, productName, price, description, imgUrl) values ('10', 'Denice', '517', 'Hej', 'https://robohash.org/enimautenim.png?size=50x50&set=set1');
