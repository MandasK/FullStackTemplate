USE [BestReads];
GO

set identity_insert [Users] on
insert into Users (Id, DisplayName, Name, Email, Bio, ImageLocation, FirebaseUserId) 
values (1, 'Mandas', 'Amanda', 'test1@a.com', 'Test Bio', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2F2%2F2b%2FWelshCorgi.jpeg&f=1&nofb=1', 'mvdtB1K6hofrQjSxdisUpbRnJS82');
insert into Users (Id, DisplayName, Name, Email, Bio, ImageLocation, FirebaseUserId) 
values (2, 'Menna', 'Meredith', 'test2@a.com', 'Test Bio', 'https://robohash.org/nisiautemet.png?size=150x150&set=set1', 'hbZYvEHpXDb9FAPGRHj5BWMpJBy2');
set identity_insert [Users] on
insert into Users (Id, DisplayName, Name, Email, Bio, ImageLocation, FirebaseUserId) 
values (3, 'Jason', 'Jason', 'test3@a.com', 'I love learning through reading. I mostly enjoy sci-fi books and non-fiction.', 'https://lh3.googleusercontent.com/pw/ACtC-3dfTdaFpZ6XJd-UCvwqVi1srDYKyeSoJfsqO1MLcB8lhq3T-OpEai5G9c7mkMG7gQ2A-PjFVBJ6-BowrZB8s7DTZIt6W1lMKcHblOBSKCUFZ9imnpjRfWCjieShQ5rdP8ffI_ZiaeK62uMOj3q3L7GukQ=w678-h903-no', '0HwEPcEInRfNamUVDM4Ip6EuWTd2');
insert into Users (Id, DisplayName, Name, Email, Bio, ImageLocation, FirebaseUserId) 
values (4, 'Landon', 'Landon', 'test4@a.com', 'I mostly enjoy scientific journals, but if I read something else, it would be any book by famed author E.L. James', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Flearn.nashvillesoftwareschool.com%2Fhs-fs%2Fhubfs%2Fmorgan_l.58856048.png%3Fwidth%3D300%26name%3Dmorgan_l.58856048.png&f=1&nofb=1', 'MhdqJ06XROd12uf65dwTgRAsupk2');
insert into Users (Id, DisplayName, Name, Email, Bio, ImageLocation, FirebaseUserId) 
values (5, 'Tyler', 'Tyler', 'test5@a.com', 'I am really into horror, especially ghost sotries', 'https://nss-day-cohort-41.github.io/images/classmates/TylerGreyHilliard.jpg', 'xcd1iWZwqEOcPrHuJE1E8UJNptI3');
insert into Users (Id, DisplayName, Name, Email, Bio, ImageLocation, FirebaseUserId) 
values (6, 'Brandon', 'Brandon', 'test6@a.com', 'I am really into beans, but when it comes to books, give me all the sci-fi and speculative fiction', 'https://nss-day-cohort-41.github.io/images/classmates/BrandonWheatley.jpg', 'OSdwt44WSOdhg0JtcKGIgN1DmXj2');
insert into Users (Id, DisplayName, Name, Email, Bio, ImageLocation, FirebaseUserId) 
values (7, 'David', 'David', 'test7@a.com', 'I just love to read, mostly fiction, but I just want an escape through books.', 'https://nss-day-cohort-41.github.io/images/classmates/DavidBruce.jpg', '2bELgEtcSmTkJZSGobw27TBEq192');
insert into Users (Id, DisplayName, Name, Email, Bio, ImageLocation, FirebaseUserId) 
values (8, 'Sisi', 'Tyler', 'test8@a.com', 'I am a doctor and software engineer by day, so I read to relax.', 'https://nss-day-cohort-41.github.io/images/classmates/SisiFreeley.JPG', 'w2Zw58awTffCuoaOA8v98dPT2Zv2');
insert into Users (Id, DisplayName, Name, Email, Bio, ImageLocation, FirebaseUserId) 
values (9, 'Trigg', 'Trigg', 'test9@a.com', 'I love reading as much as that kid on Vine loved turtles.', 'https://nss-day-cohort-41.github.io/images/classmates/TriggSumms.jpg', 'RxSm8H9N0AVNxyERKlmOD920klF2');
insert into Users (Id, DisplayName, Name, Email, Bio, ImageLocation, FirebaseUserId) 
values (10, 'John', 'John', 'test10@a.com', 'Reading is fundamental, and the library is open', 'https://nss-day-cohort-41.github.io/images/classmates/JohnHester.jpg', 'IAan2DtN8fXQMqMG0J03xp3RaRG2');
