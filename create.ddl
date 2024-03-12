
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
insert into Product (productName, price, quantity, category, imgUrl) values ('Basic', '1000', '1', 'Smarthem', 'https://duckduckgo.com/?t=ffab&q=robot&atb=v363-1&iax=images&ia=images&iai=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F4b%2F5f%2Fd3%2F4b5fd341ed56b734a5de24945fcd1c36.jpg');
insert into Product (productName, price, quantity, category, imgUrl) values ('Luke', '3000', '1', 'Smarthem+', 'https://duckduckgo.com/?t=ffab&q=robot&atb=v363-1&iax=images&ia=images&iai=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F26%2F1b%2F06%2F261b06a14ebabb0b345ae23920a998ca.jpg');
insert into Product (productName, price, quantity, category, imgUrl) values ('Jess', '3000', '1', 'Smarthem+', 'https://duckduckgo.com/?q=robots&t=ffab&atb=v363-1&iar=images&iax=images&ia=images&iai=https%3A%2F%2F1.bp.blogspot.com%2F-s-AbYbopAmQ%2FX1oveAHoiMI%2FAAAAAAAAOdk%2Fck0hNBDX8ZYBpoeUSygiuGElHykP_gwCwCLcBGAsYHQ%2Fs1788%2Fandroid_GettyImages-543190650%252Bcopy.jpg');
insert into Product (productName, price, quantity, category, imgUrl) values ('Leia', '10000', '1', 'Hemhjälp', 'https://duckduckgo.com/?q=robots&t=ffab&atb=v363-1&iar=images&iax=images&ia=images&iai=https%3A%2F%2Fblogs.3ds.com%2Fnorthamerica%2Fwp-content%2Fuploads%2Fsites%2F4%2F2019%2F08%2FRobots-Square.jpg');
insert into Product (productName, price, quantity, category, imgUrl) values ('Steve', '10000', '1', 'Avancerad', 'https://duckduckgo.com/?q=robots&t=ffab&atb=v363-1&iar=images&iax=images&ia=images&iai=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F0f%2Fb8%2F7b%2F0fb87b969edaa1267a54895889106e26.jpg');
insert into Product (productName, price, quantity, category, imgUrl) values ('Roger', '100000', '1', 'Avancerad', 'https://duckduckgo.com/?q=robots&t=ffab&atb=v363-1&iar=images&iax=images&ia=images&iai=https%3A%2F%2Fi0.wp.com%2Fchubaoyolu.org%2Fwp-content%2Fuploads%2F2016%2F05%2Frobot_ai.jpg%3Fssl%3D1');
