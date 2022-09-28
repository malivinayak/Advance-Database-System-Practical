
insert into author values('A0001', new Name('Elmasri', 'Ramez'),'7788564985');
insert into author values('A0002', new Name('Navathe', 'Shamkant'),'8989547866');
insert into author values('A0003', new Name('Arundhati', 'Roy'),'8959686859');
insert into author values('A0004', new Name('Stephen', 'King'),'7848564985');
insert into author values('A0005', new Name('Colleen', 'Hoover'),'7878952315');
insert into author values('A0006', new Name('James', 'Patterson'),'8612324529');
insert into author values('A0007', new Name('Brendan', 'DuBois'),'5915354685');


insert into book values(0133970779, 'Fundamentals of Database Systems' ,AUTHOR_ID('A0001','A0002'),'Education', publisher('P0001','Pearson Education','India'), KEYWORDS('Advance Database','ADS','Pearson','Oracle'), 593.00);
insert into book values(978000225586, 'The God of Small Things' ,AUTHOR_ID('A0003'),'Literary Fiction', publisher('P0002','IndiaInk, India','India'), KEYWORDS('Love Laws','ADS','Booker Prize','childhood','Society'), 800.00);
insert into book values(1668002175, 'Fairy Tale' ,AUTHOR_ID('A0004'),'A Novel', publisher('P0003','Scribner','US'), KEYWORDS('Novel','Story','Fairy tell','childhood','fiction'), 2110.28);
insert into book values(1501110365, 'It Ends with Us: A Novel' ,AUTHOR_ID('A0005'),'A Novel', publisher('P0004','Atria','US'), KEYWORDS('Novel','Story','It Ends with Us','hard work','real story'), 190.00);
insert into book values(0316499633, 'Blowback: James Pattersons Best Thriller in Years' ,AUTHOR_ID('A0006','A0007'),'Crime, Thriller, Mystery', publisher('P0005','Brown and Company','US'), KEYWORDS('Blowback','mystery','CIA','world war','real story','crime','Thriller'), 2055.83);
insert into book values(1501192264, 'The Green Mile' ,AUTHOR_ID('A0004','A0007','A0001'),'A Novel', publisher('P0006','Gallery Books','UK'), KEYWORDS('Green Mile','mystery','CIA','world war','horror','crime','Thriller'), 1265.00);


insert into Customer values('C0001',new name('Abhishek','Shinde'),'8656487895');
insert into Customer values('C0002',new name('Ram','Shinge'),'7848568925');
insert into Customer values('C0003',new name('Aakansha','Shinde'),'9090231546');
insert into Customer values('C0004',new name('Pratham','Patil'),'7848561523');
insert into Customer values('C0013',new Name('Vinayak','Mali'),'8080121357');
insert into Customer values('C0012',new Name('Aishwarya','Patil'),'8080131275');


insert into book_sale values('S0001','C0013',978000225586);
insert into book_sale values('S0002','C0012',978000225586);
insert into book_sale values('S0003','C0002',0133970779);
insert into book_sale values('S0004','C0013',0133970779);
insert into book_sale values('S0005','C0004',978000225586);
insert into book_sale values('S0006','C0012',1501110365);
insert into book_sale values('S0007','C0001',1501192264);
insert into book_sale values('S0008','C0004',1501110365);
insert into book_sale values('S0009','C0004',1501192264);
insert into book_sale values('S0010','C0003',0316499633);
insert into book_sale values('S0011','C0013',1668002175);
insert into book_sale values('S0012','C0002',1668002175);
insert into book_sale values('S0013','C0012',1668002175);