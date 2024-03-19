
    create table Product (
        price float(53) not null,
        productId bigserial not null,
        quantity bigint,
        category varchar(255),
        description varchar(255),
        imgUrl varchar(255),
        productName varchar(255),
        primary key (productId)
    );
insert into Product (productName, price, category, imgUrl, description) values ('Basic', '1000', 'Smarthem', 'https://cdna.artstation.com/p/assets/images/images/012/553/052/large/hannah-mccall-pose-0.jpg?1535378997','The Basic model is a simple assistant that will connect to and help you control your electronic devices in your home, such as playing your favorite music or controlling your lights.');
insert into Product (productName, price, category, imgUrl, description) values ('Luke', '3000', 'Smarthem+', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F26%2F1b%2F06%2F261b06a14ebabb0b345ae23920a998ca.jpg&f=1&nofb=1&ipt=f161a907feff5a9c77266b6f34fb08ba6363bfcd6032c375e720defb63802840&ipo=images','asdad');
insert into Product (productName, price, category, imgUrl, description) values ('Jess', '3000', 'Smarthem+', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstudiousguy.com%2Fwp-content%2Fuploads%2F2020%2F11%2FRobots.jpg&f=1&nofb=1&ipt=7a92043ab15c7b1b8f85b62b8ba9fc228f841604e9010b1047784c392142a135&ipo=images','asdad');
insert into Product (productName, price, category, imgUrl, description) values ('Leia', '10000', 'Hemhjälp', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.explicit.bing.net%2Fth%3Fid%3DOIP.2yGJbkQWtBxdW3EV10BQ7QHaHZ%26pid%3DApi&f=1&ipt=0b180d282c9584ba87fc7d50a11a9c8af45bfdf34882e977e662a5a57327890c&ipo=images','asdad');
insert into Product (productName, price, category, imgUrl, description) values ('Steve', '10000', 'Avancerad', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.8q6fs5WGC8a2WfVDSsp-TgHaHa%26pid%3DApi&f=1&ipt=79f53db0448d5fa8f87dfdbd6add42a881c4530da1951d4b7ffbcbabeca09d4f&ipo=images','asdad');
insert into Product (productName, price, category, imgUrl, description) values ('Roger', '100000', 'Avancerad', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.I8OdVdjwlV7A8Zag6QWciQHaHZ%26pid%3DApi&f=1&ipt=1189b63e284311cc737e8b25982f4524f4f8cebaa064bf683aca953299d1838c&ipo=images', 'Meet Roger, an artificial intelligence who possess all of the qualities of an actual human being. He will meet your every need, everything from walking your dog to helping your children with their homework.');
