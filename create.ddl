
    create table Product (
        price float(53) not null,
        productId bigserial not null,
        quantity bigint,
        description varchar(1000),
        category varchar(255),
        imgUrl varchar(255),
        productName varchar(255),
        primary key (productId)
    );
insert into Product (productName, price, category, imgUrl, description) values ('Basic', '1000', 'Smarthem', 'https://cdna.artstation.com/p/assets/images/images/012/553/052/large/hannah-mccall-pose-0.jpg?1535378997','Meet Basic, The Basic model is a simple assistant that will connect to and help you control your electronic devices in your home, such as playing your favorite music or controlling your lights.');
insert into Product (productName, price, category, imgUrl, description) values ('Luke', '3000', 'Smarthem+', 'https://png.pngtree.com/background/20230618/original/pngtree-ai-robot-in-action-3d-rendered-computing-or-analysis-on-a-picture-image_3710777.jpg','Meet Luke, this assistant ai have all the features of the Basic model. It will connect to and help you control your electronic devices in your home and will also roam around your home to scan for helpful advice to give you. It will notice when you are out of toilet paper or when your laundry basket is full and give you friendly reminders.');
insert into Product (productName, price, category, imgUrl, description) values ('Jess', '3000', 'Smarthem+', 'https://studiousguy.com/wp-content/uploads/2020/11/Robots.jpg','Meet Jess, this assistant ai have all the features of the Basic model. It will connect to and help you control your electronic devices in your home and will also roam around your home to scan for helpful advice to give you. It will notice when you are out of toilet paper or when your laundry basket is full and give you friendly reminders.');
insert into Product (productName, price, category, imgUrl, description) values ('Leia', '10000', 'Hemhjälp', 'https://blogs.3ds.com/northamerica/wp-content/uploads/sites/4/2019/08/Robots-Square-768x767.jpg','Meet Leia, this artificial intelligence have all the capabilities of the cheaper models. It will help you with chores around the house, such as cleaning and tidying up. It will serve you items when asked, like beverages and snacks so you can remain comfortable and relax.');
insert into Product (productName, price, category, imgUrl, description) values ('Steve', '100000', 'Avancerad', 'https://i.pinimg.com/originals/7d/9d/7a/7d9d7a2fb046c0cccb759600c7ccfdf0.png','Meet Steve, an artificial intelligence who possess all of the qualities of an actual human being. He will meet your every need, everything from walking your dog, making dinner to helping your children with their homework.');
insert into Product (productName, price, category, imgUrl, description) values ('Roger', '100000', 'Avancerad', 'https://chubaoyolu.org/wp-content/uploads/2016/05/robot_ai.jpg', 'Meet Roger, an artificial intelligence who possess all of the qualities of an actual human being. He will meet your every need, everything from walking your dog, making dinner to helping your children with their homework.');
