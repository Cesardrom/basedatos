

--Proporciona una consulta que muestre solo los clientes de Brasil.

--Consulta:
select * from customers where Country='Brazil';

/**
┌────────────┬───────────┬───────────┬──────────────────────────────────────────────────┬─────────────────────────────────┬─────────────────────┬───────┬─────────┬────────────┬────────────────────┬────────────────────┬───────────────────────────────┬──────────────┐
│ CustomerId │ FirstName │ LastName  │                     Company                      │             Address             │        City         │ State │ Country │ PostalCode │       Phone        │        Fax         │             Email             │ SupportRepId │
├────────────┼───────────┼───────────┼──────────────────────────────────────────────────┼─────────────────────────────────┼─────────────────────┼───────┼─────────┼────────────┼────────────────────┼────────────────────┼───────────────────────────────┼──────────────┤
│ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
└────────────┴───────────┴───────────┴──────────────────────────────────────────────────┴─────────────────────────────────┴─────────────────────┴───────┴─────────┴────────────┴────────────────────┴────────────────────┴───────────────────────────────┴──────────────┘
**/

--Proporciona una consulta que muestre las facturas de clientes que son de Brasil. La tabla resultante debe mostrar el nombre completo del cliente, ID de factura, fecha de la factura y país de facturación.

--Consulta:
select c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry from invoices as i, customers as c where c.CustomerId=i.CustomerId and c.Country='Brazil' ;

select c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry from invoices as i INNER JOIN customers as c on c.CustomerId=i.CustomerId and c.Country='Brazil'


/**
WHERE
┌───────────┬───────────┬───────────┬─────────────────────┬────────────────┐
│ FirstName │ LastName  │ InvoiceId │     InvoiceDate     │ BillingCountry │
├───────────┼───────────┼───────────┼─────────────────────┼────────────────┤
│ Luís      │ Gonçalves │ 98        │ 2010-03-11 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 121       │ 2010-06-13 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 143       │ 2010-09-15 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 195       │ 2011-05-06 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 316       │ 2012-10-27 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 327       │ 2012-12-07 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 382       │ 2013-08-07 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 25        │ 2009-04-09 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 154       │ 2010-11-14 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 177       │ 2011-02-16 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 199       │ 2011-05-21 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 251       │ 2012-01-09 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 372       │ 2013-07-02 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 383       │ 2013-08-12 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 57        │ 2009-09-06 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 68        │ 2009-10-17 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 123       │ 2010-06-17 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 252       │ 2012-01-22 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 275       │ 2012-04-25 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 297       │ 2012-07-28 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 349       │ 2013-03-18 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 34        │ 2009-05-23 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 155       │ 2010-11-14 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 166       │ 2010-12-25 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 221       │ 2011-08-25 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 350       │ 2013-03-31 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 373       │ 2013-07-03 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 395       │ 2013-10-05 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 35        │ 2009-06-05 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 58        │ 2009-09-07 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 80        │ 2009-12-10 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 132       │ 2010-07-31 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 253       │ 2012-01-22 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 264       │ 2012-03-03 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 319       │ 2012-11-01 00:00:00 │ Brazil         │
└───────────┴───────────┴───────────┴─────────────────────┴────────────────┘

**/

--Proporciona una consulta que muestre solo los empleados que son Agentes de Ventas.

--Consulta:
select * from employees where Title='Sales Support Agent';

/**
┌────────────┬──────────┬───────────┬─────────────────────┬───────────┬─────────────────────┬─────────────────────┬──────────────────┬─────────┬───────┬─────────┬────────────┬───────────────────┬───────────────────┬──────────────────────────┐
│ EmployeeId │ LastName │ FirstName │        Title        │ ReportsTo │      BirthDate      │      HireDate       │     Address      │  City   │ State │ Country │ PostalCode │       Phone       │        Fax        │          Email           │
├────────────┼──────────┼───────────┼─────────────────────┼───────────┼─────────────────────┼─────────────────────┼──────────────────┼─────────┼───────┼─────────┼────────────┼───────────────────┼───────────────────┼──────────────────────────┤
│ 3          │ Peacock  │ Jane      │ Sales Support Agent │ 2         │ 1973-08-29 00:00:00 │ 2002-04-01 00:00:00 │ 1111 6 Ave SW    │ Calgary │ AB    │ Canada  │ T2P 5M5    │ +1 (403) 262-3443 │ +1 (403) 262-6712 │ jane@chinookcorp.com     │
│ 4          │ Park     │ Margaret  │ Sales Support Agent │ 2         │ 1947-09-19 00:00:00 │ 2003-05-03 00:00:00 │ 683 10 Street SW │ Calgary │ AB    │ Canada  │ T2P 5G3    │ +1 (403) 263-4423 │ +1 (403) 263-4289 │ margaret@chinookcorp.com │
│ 5          │ Johnson  │ Steve     │ Sales Support Agent │ 2         │ 1965-03-03 00:00:00 │ 2003-10-17 00:00:00 │ 7727B 41 Ave     │ Calgary │ AB    │ Canada  │ T3B 1Y7    │ 1 (780) 836-9987  │ 1 (780) 836-9543  │ steve@chinookcorp.com    │
└────────────┴──────────┴───────────┴─────────────────────┴───────────┴─────────────────────┴─────────────────────┴──────────────────┴─────────┴───────┴─────────┴────────────┴───────────────────┴───────────────────┴──────────────────────────┘
**/

--Proporciona una consulta que muestre una lista única de países de facturación de la tabla de Facturas.

--Consulta:
select DISTINCT(BillingCountry) as paises_facturacion from invoices;

/**
┌────────────────────┐
│ paises_facturacion │
├────────────────────┤
│ Germany            │
│ Norway             │
│ Belgium            │
│ Canada             │
│ USA                │
│ France             │
│ Ireland            │
│ United Kingdom     │
│ Australia          │
│ Chile              │
│ India              │
│ Brazil             │
│ Portugal           │
│ Netherlands        │
│ Spain              │
│ Sweden             │
│ Czech Republic     │
│ Finland            │
│ Denmark            │
│ Italy              │
│ Poland             │
│ Austria            │
│ Hungary            │
│ Argentina          │
└────────────────────┘

**/

--Proporciona una consulta que muestre las facturas de clientes que son de Brasil.

--Consulta:
select i.* from invoices as i INNER JOIN customers as c on c.CustomerId=i.CustomerId and c.Country='Brazil';

select i.*  from invoices as i, customers as c where c.CustomerId=i.CustomerId and c.Country='Brazil' ;

/**
┌───────────┬────────────┬─────────────────────┬─────────────────────────────────┬─────────────────────┬──────────────┬────────────────┬───────────────────┬───────┐
│ InvoiceId │ CustomerId │     InvoiceDate     │         BillingAddress          │     BillingCity     │ BillingState │ BillingCountry │ BillingPostalCode │ Total │
├───────────┼────────────┼─────────────────────┼─────────────────────────────────┼─────────────────────┼──────────────┼────────────────┼───────────────────┼───────┤
│ 98        │ 1          │ 2010-03-11 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.98  │
│ 121       │ 1          │ 2010-06-13 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.96  │
│ 143       │ 1          │ 2010-09-15 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 5.94  │
│ 195       │ 1          │ 2011-05-06 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 0.99  │
│ 316       │ 1          │ 2012-10-27 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 1.98  │
│ 327       │ 1          │ 2012-12-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 13.86 │
│ 382       │ 1          │ 2013-08-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 8.91  │
│ 25        │ 10         │ 2009-04-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 8.91  │
│ 154       │ 10         │ 2010-11-14 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │
│ 177       │ 10         │ 2011-02-16 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 3.96  │
│ 199       │ 10         │ 2011-05-21 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 5.94  │
│ 251       │ 10         │ 2012-01-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 0.99  │
│ 372       │ 10         │ 2013-07-02 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │
│ 383       │ 10         │ 2013-08-12 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 13.86 │
│ 57        │ 11         │ 2009-09-06 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │
│ 68        │ 11         │ 2009-10-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 13.86 │
│ 123       │ 11         │ 2010-06-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 8.91  │
│ 252       │ 11         │ 2012-01-22 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │
│ 275       │ 11         │ 2012-04-25 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 3.96  │
│ 297       │ 11         │ 2012-07-28 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 5.94  │
│ 349       │ 11         │ 2013-03-18 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 0.99  │
│ 34        │ 12         │ 2009-05-23 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 0.99  │
│ 155       │ 12         │ 2010-11-14 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │
│ 166       │ 12         │ 2010-12-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 13.86 │
│ 221       │ 12         │ 2011-08-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 8.91  │
│ 350       │ 12         │ 2013-03-31 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │
│ 373       │ 12         │ 2013-07-03 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 3.96  │
│ 395       │ 12         │ 2013-10-05 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 5.94  │
│ 35        │ 13         │ 2009-06-05 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │
│ 58        │ 13         │ 2009-09-07 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 3.96  │
│ 80        │ 13         │ 2009-12-10 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 5.94  │
│ 132       │ 13         │ 2010-07-31 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 0.99  │
│ 253       │ 13         │ 2012-01-22 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │
│ 264       │ 13         │ 2012-03-03 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 13.86 │
│ 319       │ 13         │ 2012-11-01 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 8.91  │
└───────────┴────────────┴─────────────────────┴─────────────────────────────────┴─────────────────────┴──────────────┴────────────────┴───────────────────┴───────┘

**/

--Proporciona una consulta que muestre las facturas asociadas con cada agente de ventas. La tabla resultante debe incluir el nombre completo del Agente de Ventas.

--Consulta:
select i.*, e.FirstName, e.LastName from customers as c, employees as e, invoices as i where c.SupportRepId=e.EmployeeId and c.CustomerId=i.CustomerId and e.Title='Sales Support Agent';

select i.*, e.FirstName, e.LastName from invoices as i INNER JOIN customers as c, employees as e on c.SupportRepId=e.EmployeeId and c.CustomerId=i.CustomerId and e.Title='Sales Support Agent';

/**
┌───────────┬────────────┬─────────────────────┬──────────────────────────────────────────┬─────────────────────┬──────────────┬────────────────┬───────────────────┬───────┬───────────┬──────────┐
│ InvoiceId │ CustomerId │     InvoiceDate     │              BillingAddress              │     BillingCity     │ BillingState │ BillingCountry │ BillingPostalCode │ Total │ FirstName │ LastName │
├───────────┼────────────┼─────────────────────┼──────────────────────────────────────────┼─────────────────────┼──────────────┼────────────────┼───────────────────┼───────┼───────────┼──────────┤
│ 98        │ 1          │ 2010-03-11 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.98  │ Jane      │ Peacock  │
│ 121       │ 1          │ 2010-06-13 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.96  │ Jane      │ Peacock  │
│ 143       │ 1          │ 2010-09-15 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 5.94  │ Jane      │ Peacock  │
│ 195       │ 1          │ 2011-05-06 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 0.99  │ Jane      │ Peacock  │
│ 316       │ 1          │ 2012-10-27 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 1.98  │ Jane      │ Peacock  │
│ 327       │ 1          │ 2012-12-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 13.86 │ Jane      │ Peacock  │
│ 382       │ 1          │ 2013-08-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 8.91  │ Jane      │ Peacock  │
│ 99        │ 3          │ 2010-03-11 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 3.98  │ Jane      │ Peacock  │
│ 110       │ 3          │ 2010-04-21 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 13.86 │ Jane      │ Peacock  │
│ 165       │ 3          │ 2010-12-20 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 8.91  │ Jane      │ Peacock  │
│ 294       │ 3          │ 2012-07-26 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 1.98  │ Jane      │ Peacock  │
│ 317       │ 3          │ 2012-10-28 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 3.96  │ Jane      │ Peacock  │
│ 339       │ 3          │ 2013-01-30 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 5.94  │ Jane      │ Peacock  │
│ 391       │ 3          │ 2013-09-20 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 0.99  │ Jane      │ Peacock  │
│ 34        │ 12         │ 2009-05-23 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 0.99  │ Jane      │ Peacock  │
│ 155       │ 12         │ 2010-11-14 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │ Jane      │ Peacock  │
│ 166       │ 12         │ 2010-12-25 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 13.86 │ Jane      │ Peacock  │
│ 221       │ 12         │ 2011-08-25 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 8.91  │ Jane      │ Peacock  │
│ 350       │ 12         │ 2013-03-31 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │ Jane      │ Peacock  │
│ 373       │ 12         │ 2013-07-03 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 3.96  │ Jane      │ Peacock  │
│ 395       │ 12         │ 2013-10-05 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 5.94  │ Jane      │ Peacock  │
│ 36        │ 15         │ 2009-06-05 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 1.98  │ Jane      │ Peacock  │
│ 47        │ 15         │ 2009-07-16 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 13.86 │ Jane      │ Peacock  │
│ 102       │ 15         │ 2010-03-16 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 9.91  │ Jane      │ Peacock  │
│ 231       │ 15         │ 2011-10-21 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 1.98  │ Jane      │ Peacock  │
│ 254       │ 15         │ 2012-01-23 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 3.96  │ Jane      │ Peacock  │
│ 276       │ 15         │ 2012-04-26 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 5.94  │ Jane      │ Peacock  │
│ 328       │ 15         │ 2012-12-15 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 0.99  │ Jane      │ Peacock  │
│ 112       │ 18         │ 2010-05-12 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 1.98  │ Jane      │ Peacock  │
│ 135       │ 18         │ 2010-08-14 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 3.96  │ Jane      │ Peacock  │
│ 157       │ 18         │ 2010-11-16 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 5.94  │ Jane      │ Peacock  │
│ 209       │ 18         │ 2011-07-07 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 0.99  │ Jane      │ Peacock  │
│ 330       │ 18         │ 2012-12-28 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 1.98  │ Jane      │ Peacock  │
│ 341       │ 18         │ 2013-02-07 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 13.86 │ Jane      │ Peacock  │
│ 396       │ 18         │ 2013-10-08 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 8.91  │ Jane      │ Peacock  │
│ 15        │ 19         │ 2009-03-04 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 1.98  │ Jane      │ Peacock  │
│ 26        │ 19         │ 2009-04-14 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 13.86 │ Jane      │ Peacock  │
│ 81        │ 19         │ 2009-12-13 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 8.91  │ Jane      │ Peacock  │
│ 210       │ 19         │ 2011-07-20 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 1.98  │ Jane      │ Peacock  │
│ 233       │ 19         │ 2011-10-22 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 3.96  │ Jane      │ Peacock  │
│ 255       │ 19         │ 2012-01-24 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 5.94  │ Jane      │ Peacock  │
│ 307       │ 19         │ 2012-09-13 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 1.99  │ Jane      │ Peacock  │
│ 92        │ 24         │ 2010-02-08 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 1.98  │ Jane      │ Peacock  │
│ 103       │ 24         │ 2010-03-21 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 15.86 │ Jane      │ Peacock  │
│ 158       │ 24         │ 2010-11-19 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 8.91  │ Jane      │ Peacock  │
│ 287       │ 24         │ 2012-06-25 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 1.98  │ Jane      │ Peacock  │
│ 310       │ 24         │ 2012-09-27 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 7.96  │ Jane      │ Peacock  │
│ 332       │ 24         │ 2012-12-30 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 5.94  │ Jane      │ Peacock  │
│ 384       │ 24         │ 2013-08-20 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 0.99  │ Jane      │ Peacock  │
│ 48        │ 29         │ 2009-07-24 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 0.99  │ Jane      │ Peacock  │
│ 169       │ 29         │ 2011-01-15 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 1.98  │ Jane      │ Peacock  │
│ 180       │ 29         │ 2011-02-25 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 13.86 │ Jane      │ Peacock  │
│ 235       │ 29         │ 2011-10-26 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 8.91  │ Jane      │ Peacock  │
│ 364       │ 29         │ 2013-06-01 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 1.98  │ Jane      │ Peacock  │
│ 387       │ 29         │ 2013-09-03 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 3.96  │ Jane      │ Peacock  │
│ 409       │ 29         │ 2013-12-06 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 5.94  │ Jane      │ Peacock  │
│ 49        │ 30         │ 2009-08-06 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 1.98  │ Jane      │ Peacock  │
│ 72        │ 30         │ 2009-11-08 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 3.96  │ Jane      │ Peacock  │
│ 94        │ 30         │ 2010-02-10 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 5.94  │ Jane      │ Peacock  │
│ 146       │ 30         │ 2010-10-01 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 0.99  │ Jane      │ Peacock  │
│ 267       │ 30         │ 2012-03-24 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 1.98  │ Jane      │ Peacock  │
│ 278       │ 30         │ 2012-05-04 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 13.86 │ Jane      │ Peacock  │
│ 333       │ 30         │ 2013-01-02 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 8.91  │ Jane      │ Peacock  │
│ 27        │ 33         │ 2009-04-22 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 0.99  │ Jane      │ Peacock  │
│ 148       │ 33         │ 2010-10-14 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 1.98  │ Jane      │ Peacock  │
│ 159       │ 33         │ 2010-11-24 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 13.86 │ Jane      │ Peacock  │
│ 214       │ 33         │ 2011-07-25 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 8.91  │ Jane      │ Peacock  │
│ 343       │ 33         │ 2013-02-28 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 1.98  │ Jane      │ Peacock  │
│ 366       │ 33         │ 2013-06-02 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 3.96  │ Jane      │ Peacock  │
│ 388       │ 33         │ 2013-09-04 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 5.94  │ Jane      │ Peacock  │
│ 6         │ 37         │ 2009-01-19 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 0.99  │ Jane      │ Peacock  │
│ 127       │ 37         │ 2010-07-13 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 1.98  │ Jane      │ Peacock  │
│ 138       │ 37         │ 2010-08-23 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 13.86 │ Jane      │ Peacock  │
│ 193       │ 37         │ 2011-04-23 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 14.91 │ Jane      │ Peacock  │
│ 322       │ 37         │ 2012-11-27 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 1.98  │ Jane      │ Peacock  │
│ 345       │ 37         │ 2013-03-01 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 3.96  │ Jane      │ Peacock  │
│ 367       │ 37         │ 2013-06-03 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 5.94  │ Jane      │ Peacock  │
│ 7         │ 38         │ 2009-02-01 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 1.98  │ Jane      │ Peacock  │
│ 30        │ 38         │ 2009-05-06 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 3.96  │ Jane      │ Peacock  │
│ 52        │ 38         │ 2009-08-08 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 5.94  │ Jane      │ Peacock  │
│ 104       │ 38         │ 2010-03-29 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 0.99  │ Jane      │ Peacock  │
│ 225       │ 38         │ 2011-09-20 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 1.98  │ Jane      │ Peacock  │
│ 236       │ 38         │ 2011-10-31 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 13.86 │ Jane      │ Peacock  │
│ 291       │ 38         │ 2012-06-30 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 8.91  │ Jane      │ Peacock  │
│ 9         │ 42         │ 2009-02-02 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 3.96  │ Jane      │ Peacock  │
│ 31        │ 42         │ 2009-05-07 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 5.94  │ Jane      │ Peacock  │
│ 83        │ 42         │ 2009-12-26 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 0.99  │ Jane      │ Peacock  │
│ 204       │ 42         │ 2011-06-19 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 3.98  │ Jane      │ Peacock  │
│ 215       │ 42         │ 2011-07-30 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 13.86 │ Jane      │ Peacock  │
│ 270       │ 42         │ 2012-03-29 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 8.91  │ Jane      │ Peacock  │
│ 399       │ 42         │ 2013-11-03 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 1.98  │ Jane      │ Peacock  │
│ 84        │ 43         │ 2010-01-08 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 1.98  │ Jane      │ Peacock  │
│ 107       │ 43         │ 2010-04-12 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 3.96  │ Jane      │ Peacock  │
│ 129       │ 43         │ 2010-07-15 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 5.94  │ Jane      │ Peacock  │
│ 181       │ 43         │ 2011-03-05 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 0.99  │ Jane      │ Peacock  │
│ 302       │ 43         │ 2012-08-26 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 1.98  │ Jane      │ Peacock  │
│ 313       │ 43         │ 2012-10-06 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 16.86 │ Jane      │ Peacock  │
│ 368       │ 43         │ 2013-06-06 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 8.91  │ Jane      │ Peacock  │
│ 53        │ 44         │ 2009-08-11 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 8.91  │ Jane      │ Peacock  │
│ 182       │ 44         │ 2011-03-18 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 1.98  │ Jane      │ Peacock  │
│ 205       │ 44         │ 2011-06-20 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 7.96  │ Jane      │ Peacock  │
│ 227       │ 44         │ 2011-09-22 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 5.94  │ Jane      │ Peacock  │
│ 279       │ 44         │ 2012-05-12 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 0.99  │ Jane      │ Peacock  │
│ 400       │ 44         │ 2013-11-03 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 1.98  │ Jane      │ Peacock  │
│ 411       │ 44         │ 2013-12-14 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 13.86 │ Jane      │ Peacock  │
│ 85        │ 45         │ 2010-01-08 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 1.98  │ Jane      │ Peacock  │
│ 96        │ 45         │ 2010-02-18 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 21.86 │ Jane      │ Peacock  │
│ 151       │ 45         │ 2010-10-19 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 8.91  │ Jane      │ Peacock  │
│ 280       │ 45         │ 2012-05-25 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 1.98  │ Jane      │ Peacock  │
│ 303       │ 45         │ 2012-08-27 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 3.96  │ Jane      │ Peacock  │
│ 325       │ 45         │ 2012-11-29 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 5.94  │ Jane      │ Peacock  │
│ 377       │ 45         │ 2013-07-20 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 0.99  │ Jane      │ Peacock  │
│ 10        │ 46         │ 2009-02-03 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 5.94  │ Jane      │ Peacock  │
│ 62        │ 46         │ 2009-09-24 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 0.99  │ Jane      │ Peacock  │
│ 183       │ 46         │ 2011-03-18 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 1.98  │ Jane      │ Peacock  │
│ 194       │ 46         │ 2011-04-28 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 21.86 │ Jane      │ Peacock  │
│ 249       │ 46         │ 2011-12-27 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 8.91  │ Jane      │ Peacock  │
│ 378       │ 46         │ 2013-08-02 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 1.98  │ Jane      │ Peacock  │
│ 401       │ 46         │ 2013-11-04 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 3.96  │ Jane      │ Peacock  │
│ 11        │ 52         │ 2009-02-06 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 8.91  │ Jane      │ Peacock  │
│ 140       │ 52         │ 2010-09-13 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 1.98  │ Jane      │ Peacock  │
│ 163       │ 52         │ 2010-12-16 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 3.96  │ Jane      │ Peacock  │
│ 185       │ 52         │ 2011-03-20 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 5.94  │ Jane      │ Peacock  │
│ 237       │ 52         │ 2011-11-08 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 0.99  │ Jane      │ Peacock  │
│ 358       │ 52         │ 2013-05-01 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 1.98  │ Jane      │ Peacock  │
│ 369       │ 52         │ 2013-06-11 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 13.86 │ Jane      │ Peacock  │
│ 43        │ 53         │ 2009-07-06 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 1.98  │ Jane      │ Peacock  │
│ 54        │ 53         │ 2009-08-16 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 13.86 │ Jane      │ Peacock  │
│ 109       │ 53         │ 2010-04-16 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 8.91  │ Jane      │ Peacock  │
│ 238       │ 53         │ 2011-11-21 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 1.98  │ Jane      │ Peacock  │
│ 261       │ 53         │ 2012-02-23 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 3.96  │ Jane      │ Peacock  │
│ 283       │ 53         │ 2012-05-27 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 5.94  │ Jane      │ Peacock  │
│ 335       │ 53         │ 2013-01-15 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 0.99  │ Jane      │ Peacock  │
│ 120       │ 58         │ 2010-06-12 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 1.98  │ Jane      │ Peacock  │
│ 131       │ 58         │ 2010-07-23 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 13.86 │ Jane      │ Peacock  │
│ 186       │ 58         │ 2011-03-23 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 8.91  │ Jane      │ Peacock  │
│ 315       │ 58         │ 2012-10-27 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 1.98  │ Jane      │ Peacock  │
│ 338       │ 58         │ 2013-01-29 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 3.96  │ Jane      │ Peacock  │
│ 360       │ 58         │ 2013-05-03 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 5.94  │ Jane      │ Peacock  │
│ 412       │ 58         │ 2013-12-22 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 1.99  │ Jane      │ Peacock  │
│ 23        │ 59         │ 2009-04-05 00:00:00 │ 3,Raj Bhavan Road                        │ Bangalore           │              │ India          │ 560001            │ 3.96  │ Jane      │ Peacock  │
│ 45        │ 59         │ 2009-07-08 00:00:00 │ 3,Raj Bhavan Road                        │ Bangalore           │              │ India          │ 560001            │ 5.94  │ Jane      │ Peacock  │
│ 97        │ 59         │ 2010-02-26 00:00:00 │ 3,Raj Bhavan Road                        │ Bangalore           │              │ India          │ 560001            │ 1.99  │ Jane      │ Peacock  │
│ 218       │ 59         │ 2011-08-20 00:00:00 │ 3,Raj Bhavan Road                        │ Bangalore           │              │ India          │ 560001            │ 1.98  │ Jane      │ Peacock  │
│ 229       │ 59         │ 2011-09-30 00:00:00 │ 3,Raj Bhavan Road                        │ Bangalore           │              │ India          │ 560001            │ 13.86 │ Jane      │ Peacock  │
│ 284       │ 59         │ 2012-05-30 00:00:00 │ 3,Raj Bhavan Road                        │ Bangalore           │              │ India          │ 560001            │ 8.91  │ Jane      │ Peacock  │
│ 2         │ 4          │ 2009-01-02 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 3.96  │ Margaret  │ Park     │
│ 24        │ 4          │ 2009-04-06 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 5.94  │ Margaret  │ Park     │
│ 76        │ 4          │ 2009-11-25 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 0.99  │ Margaret  │ Park     │
│ 197       │ 4          │ 2011-05-19 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 1.98  │ Margaret  │ Park     │
│ 208       │ 4          │ 2011-06-29 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 15.86 │ Margaret  │ Park     │
│ 263       │ 4          │ 2012-02-27 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 8.91  │ Margaret  │ Park     │
│ 392       │ 4          │ 2013-10-03 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 1.98  │ Margaret  │ Park     │
│ 77        │ 5          │ 2009-12-08 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 1.98  │ Margaret  │ Park     │
│ 100       │ 5          │ 2010-03-12 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 3.96  │ Margaret  │ Park     │
│ 122       │ 5          │ 2010-06-14 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 5.94  │ Margaret  │ Park     │
│ 174       │ 5          │ 2011-02-02 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 0.99  │ Margaret  │ Park     │
│ 295       │ 5          │ 2012-07-26 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 1.98  │ Margaret  │ Park     │
│ 306       │ 5          │ 2012-09-05 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 16.86 │ Margaret  │ Park     │
│ 361       │ 5          │ 2013-05-06 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 8.91  │ Margaret  │ Park     │
│ 3         │ 8          │ 2009-01-03 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 5.94  │ Margaret  │ Park     │
│ 55        │ 8          │ 2009-08-24 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 0.99  │ Margaret  │ Park     │
│ 176       │ 8          │ 2011-02-15 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 1.98  │ Margaret  │ Park     │
│ 187       │ 8          │ 2011-03-28 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 13.86 │ Margaret  │ Park     │
│ 242       │ 8          │ 2011-11-26 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 8.91  │ Margaret  │ Park     │
│ 371       │ 8          │ 2013-07-02 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 1.98  │ Margaret  │ Park     │
│ 394       │ 8          │ 2013-10-04 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 3.96  │ Margaret  │ Park     │
│ 56        │ 9          │ 2009-09-06 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 1.98  │ Margaret  │ Park     │
│ 79        │ 9          │ 2009-12-09 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 3.96  │ Margaret  │ Park     │
│ 101       │ 9          │ 2010-03-13 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 5.94  │ Margaret  │ Park     │
│ 153       │ 9          │ 2010-11-01 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 0.99  │ Margaret  │ Park     │
│ 274       │ 9          │ 2012-04-24 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 1.98  │ Margaret  │ Park     │
│ 285       │ 9          │ 2012-06-04 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 13.86 │ Margaret  │ Park     │
│ 340       │ 9          │ 2013-02-02 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 8.91  │ Margaret  │ Park     │
│ 25        │ 10         │ 2009-04-09 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 8.91  │ Margaret  │ Park     │
│ 154       │ 10         │ 2010-11-14 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │ Margaret  │ Park     │
│ 177       │ 10         │ 2011-02-16 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 3.96  │ Margaret  │ Park     │
│ 199       │ 10         │ 2011-05-21 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 5.94  │ Margaret  │ Park     │
│ 251       │ 10         │ 2012-01-09 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 0.99  │ Margaret  │ Park     │
│ 372       │ 10         │ 2013-07-02 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │ Margaret  │ Park     │
│ 383       │ 10         │ 2013-08-12 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 13.86 │ Margaret  │ Park     │
│ 35        │ 13         │ 2009-06-05 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │ Margaret  │ Park     │
│ 58        │ 13         │ 2009-09-07 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 3.96  │ Margaret  │ Park     │
│ 80        │ 13         │ 2009-12-10 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 5.94  │ Margaret  │ Park     │
│ 132       │ 13         │ 2010-07-31 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 0.99  │ Margaret  │ Park     │
│ 253       │ 13         │ 2012-01-22 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │ Margaret  │ Park     │
│ 264       │ 13         │ 2012-03-03 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 13.86 │ Margaret  │ Park     │
│ 319       │ 13         │ 2012-11-01 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 8.91  │ Margaret  │ Park     │
│ 13        │ 16         │ 2009-02-19 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 0.99  │ Margaret  │ Park     │
│ 134       │ 16         │ 2010-08-13 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 1.98  │ Margaret  │ Park     │
│ 145       │ 16         │ 2010-09-23 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 13.86 │ Margaret  │ Park     │
│ 200       │ 16         │ 2011-05-24 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 8.91  │ Margaret  │ Park     │
│ 329       │ 16         │ 2012-12-28 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 1.98  │ Margaret  │ Park     │
│ 352       │ 16         │ 2013-04-01 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 3.96  │ Margaret  │ Park     │
│ 374       │ 16         │ 2013-07-04 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 5.94  │ Margaret  │ Park     │
│ 113       │ 20         │ 2010-05-12 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 1.98  │ Margaret  │ Park     │
│ 124       │ 20         │ 2010-06-22 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 13.86 │ Margaret  │ Park     │
│ 179       │ 20         │ 2011-02-20 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 8.91  │ Margaret  │ Park     │
│ 308       │ 20         │ 2012-09-26 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 3.98  │ Margaret  │ Park     │
│ 331       │ 20         │ 2012-12-29 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 3.96  │ Margaret  │ Park     │
│ 353       │ 20         │ 2013-04-02 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 5.94  │ Margaret  │ Park     │
│ 405       │ 20         │ 2013-11-21 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 0.99  │ Margaret  │ Park     │
│ 91        │ 22         │ 2010-02-08 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 1.98  │ Margaret  │ Park     │
│ 114       │ 22         │ 2010-05-13 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 3.96  │ Margaret  │ Park     │
│ 136       │ 22         │ 2010-08-15 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 5.94  │ Margaret  │ Park     │
│ 188       │ 22         │ 2011-04-05 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 0.99  │ Margaret  │ Park     │
│ 309       │ 22         │ 2012-09-26 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 3.98  │ Margaret  │ Park     │
│ 320       │ 22         │ 2012-11-06 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 13.86 │ Margaret  │ Park     │
│ 375       │ 22         │ 2013-07-07 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 8.91  │ Margaret  │ Park     │
│ 5         │ 23         │ 2009-01-11 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 13.86 │ Margaret  │ Park     │
│ 60        │ 23         │ 2009-09-11 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 8.91  │ Margaret  │ Park     │
│ 189       │ 23         │ 2011-04-18 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 1.98  │ Margaret  │ Park     │
│ 212       │ 23         │ 2011-07-21 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 3.96  │ Margaret  │ Park     │
│ 234       │ 23         │ 2011-10-23 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 5.94  │ Margaret  │ Park     │
│ 286       │ 23         │ 2012-06-12 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 0.99  │ Margaret  │ Park     │
│ 407       │ 23         │ 2013-12-04 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 1.98  │ Margaret  │ Park     │
│ 70        │ 26         │ 2009-11-07 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 1.98  │ Margaret  │ Park     │
│ 93        │ 26         │ 2010-02-09 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 3.96  │ Margaret  │ Park     │
│ 115       │ 26         │ 2010-05-14 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 5.94  │ Margaret  │ Park     │
│ 167       │ 26         │ 2011-01-02 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 0.99  │ Margaret  │ Park     │
│ 288       │ 26         │ 2012-06-25 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 1.98  │ Margaret  │ Park     │
│ 299       │ 26         │ 2012-08-05 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 23.86 │ Margaret  │ Park     │
│ 354       │ 26         │ 2013-04-05 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 8.91  │ Margaret  │ Park     │
│ 39        │ 27         │ 2009-06-10 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 8.91  │ Margaret  │ Park     │
│ 168       │ 27         │ 2011-01-15 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 1.98  │ Margaret  │ Park     │
│ 191       │ 27         │ 2011-04-19 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 3.96  │ Margaret  │ Park     │
│ 213       │ 27         │ 2011-07-22 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 5.94  │ Margaret  │ Park     │
│ 265       │ 27         │ 2012-03-11 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 0.99  │ Margaret  │ Park     │
│ 386       │ 27         │ 2013-09-02 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 1.98  │ Margaret  │ Park     │
│ 397       │ 27         │ 2013-10-13 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 13.86 │ Margaret  │ Park     │
│ 50        │ 32         │ 2009-08-06 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 1.98  │ Margaret  │ Park     │
│ 61        │ 32         │ 2009-09-16 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 13.86 │ Margaret  │ Park     │
│ 116       │ 32         │ 2010-05-17 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 8.91  │ Margaret  │ Park     │
│ 245       │ 32         │ 2011-12-22 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 1.98  │ Margaret  │ Park     │
│ 268       │ 32         │ 2012-03-25 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 3.96  │ Margaret  │ Park     │
│ 290       │ 32         │ 2012-06-27 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 5.94  │ Margaret  │ Park     │
│ 342       │ 32         │ 2013-02-15 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 0.99  │ Margaret  │ Park     │
│ 28        │ 34         │ 2009-05-05 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 1.98  │ Margaret  │ Park     │
│ 51        │ 34         │ 2009-08-07 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 3.96  │ Margaret  │ Park     │
│ 73        │ 34         │ 2009-11-09 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 5.94  │ Margaret  │ Park     │
│ 125       │ 34         │ 2010-06-30 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 0.99  │ Margaret  │ Park     │
│ 246       │ 34         │ 2011-12-22 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 1.98  │ Margaret  │ Park     │
│ 257       │ 34         │ 2012-02-01 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 13.86 │ Margaret  │ Park     │
│ 312       │ 34         │ 2012-10-01 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 10.91 │ Margaret  │ Park     │
│ 126       │ 35         │ 2010-07-13 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 1.98  │ Margaret  │ Park     │
│ 149       │ 35         │ 2010-10-15 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 3.96  │ Margaret  │ Park     │
│ 171       │ 35         │ 2011-01-17 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 5.94  │ Margaret  │ Park     │
│ 223       │ 35         │ 2011-09-07 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 0.99  │ Margaret  │ Park     │
│ 344       │ 35         │ 2013-02-28 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 1.98  │ Margaret  │ Park     │
│ 355       │ 35         │ 2013-04-10 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 13.86 │ Margaret  │ Park     │
│ 410       │ 35         │ 2013-12-09 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 8.91  │ Margaret  │ Park     │
│ 105       │ 39         │ 2010-04-11 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 1.98  │ Margaret  │ Park     │
│ 128       │ 39         │ 2010-07-14 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 3.96  │ Margaret  │ Park     │
│ 150       │ 39         │ 2010-10-16 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 5.94  │ Margaret  │ Park     │
│ 202       │ 39         │ 2011-06-06 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 1.99  │ Margaret  │ Park     │
│ 323       │ 39         │ 2012-11-27 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 1.98  │ Margaret  │ Park     │
│ 334       │ 39         │ 2013-01-07 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 13.86 │ Margaret  │ Park     │
│ 389       │ 39         │ 2013-09-07 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 8.91  │ Margaret  │ Park     │
│ 8         │ 40         │ 2009-02-01 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 1.98  │ Margaret  │ Park     │
│ 19        │ 40         │ 2009-03-14 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 13.86 │ Margaret  │ Park     │
│ 74        │ 40         │ 2009-11-12 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 8.91  │ Margaret  │ Park     │
│ 203       │ 40         │ 2011-06-19 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 2.98  │ Margaret  │ Park     │
│ 226       │ 40         │ 2011-09-21 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 3.96  │ Margaret  │ Park     │
│ 248       │ 40         │ 2011-12-24 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 5.94  │ Margaret  │ Park     │
│ 300       │ 40         │ 2012-08-13 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 0.99  │ Margaret  │ Park     │
│ 64        │ 49         │ 2009-10-07 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 1.98  │ Margaret  │ Park     │
│ 75        │ 49         │ 2009-11-17 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 13.86 │ Margaret  │ Park     │
│ 130       │ 49         │ 2010-07-18 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 8.91  │ Margaret  │ Park     │
│ 259       │ 49         │ 2012-02-22 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 1.98  │ Margaret  │ Park     │
│ 282       │ 49         │ 2012-05-26 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 3.96  │ Margaret  │ Park     │
│ 304       │ 49         │ 2012-08-28 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 5.94  │ Margaret  │ Park     │
│ 356       │ 49         │ 2013-04-18 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 0.99  │ Margaret  │ Park     │
│ 21        │ 55         │ 2009-04-04 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 1.98  │ Margaret  │ Park     │
│ 44        │ 55         │ 2009-07-07 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 3.96  │ Margaret  │ Park     │
│ 66        │ 55         │ 2009-10-09 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 5.94  │ Margaret  │ Park     │
│ 118       │ 55         │ 2010-05-30 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 0.99  │ Margaret  │ Park     │
│ 239       │ 55         │ 2011-11-21 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 1.98  │ Margaret  │ Park     │
│ 250       │ 55         │ 2012-01-01 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 13.86 │ Margaret  │ Park     │
│ 305       │ 55         │ 2012-08-31 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 8.91  │ Margaret  │ Park     │
│ 119       │ 56         │ 2010-06-12 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 1.98  │ Margaret  │ Park     │
│ 142       │ 56         │ 2010-09-14 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 3.96  │ Margaret  │ Park     │
│ 164       │ 56         │ 2010-12-17 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 5.94  │ Margaret  │ Park     │
│ 216       │ 56         │ 2011-08-07 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 0.99  │ Margaret  │ Park     │
│ 337       │ 56         │ 2013-01-28 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 1.98  │ Margaret  │ Park     │
│ 348       │ 56         │ 2013-03-10 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 13.86 │ Margaret  │ Park     │
│ 403       │ 56         │ 2013-11-08 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 8.91  │ Margaret  │ Park     │
│ 1         │ 2          │ 2009-01-01 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 1.98  │ Steve     │ Johnson  │
│ 12        │ 2          │ 2009-02-11 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 13.86 │ Steve     │ Johnson  │
│ 67        │ 2          │ 2009-10-12 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 8.91  │ Steve     │ Johnson  │
│ 196       │ 2          │ 2011-05-19 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 1.98  │ Steve     │ Johnson  │
│ 219       │ 2          │ 2011-08-21 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 3.96  │ Steve     │ Johnson  │
│ 241       │ 2          │ 2011-11-23 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 5.94  │ Steve     │ Johnson  │
│ 293       │ 2          │ 2012-07-13 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 0.99  │ Steve     │ Johnson  │
│ 46        │ 6          │ 2009-07-11 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 8.91  │ Steve     │ Johnson  │
│ 175       │ 6          │ 2011-02-15 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 1.98  │ Steve     │ Johnson  │
│ 198       │ 6          │ 2011-05-20 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 3.96  │ Steve     │ Johnson  │
│ 220       │ 6          │ 2011-08-22 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 5.94  │ Steve     │ Johnson  │
│ 272       │ 6          │ 2012-04-11 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 0.99  │ Steve     │ Johnson  │
│ 393       │ 6          │ 2013-10-03 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 1.98  │ Steve     │ Johnson  │
│ 404       │ 6          │ 2013-11-13 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 25.86 │ Steve     │ Johnson  │
│ 78        │ 7          │ 2009-12-08 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 1.98  │ Steve     │ Johnson  │
│ 89        │ 7          │ 2010-01-18 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 18.86 │ Steve     │ Johnson  │
│ 144       │ 7          │ 2010-09-18 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 8.91  │ Steve     │ Johnson  │
│ 273       │ 7          │ 2012-04-24 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 1.98  │ Steve     │ Johnson  │
│ 296       │ 7          │ 2012-07-27 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 3.96  │ Steve     │ Johnson  │
│ 318       │ 7          │ 2012-10-29 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 5.94  │ Steve     │ Johnson  │
│ 370       │ 7          │ 2013-06-19 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 0.99  │ Steve     │ Johnson  │
│ 57        │ 11         │ 2009-09-06 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │ Steve     │ Johnson  │
│ 68        │ 11         │ 2009-10-17 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 13.86 │ Steve     │ Johnson  │
│ 123       │ 11         │ 2010-06-17 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 8.91  │ Steve     │ Johnson  │
│ 252       │ 11         │ 2012-01-22 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │ Steve     │ Johnson  │
│ 275       │ 11         │ 2012-04-25 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 3.96  │ Steve     │ Johnson  │
│ 297       │ 11         │ 2012-07-28 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 5.94  │ Steve     │ Johnson  │
│ 349       │ 11         │ 2013-03-18 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 0.99  │ Steve     │ Johnson  │
│ 4         │ 14         │ 2009-01-06 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 8.91  │ Steve     │ Johnson  │
│ 133       │ 14         │ 2010-08-13 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 1.98  │ Steve     │ Johnson  │
│ 156       │ 14         │ 2010-11-15 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 3.96  │ Steve     │ Johnson  │
│ 178       │ 14         │ 2011-02-17 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 5.94  │ Steve     │ Johnson  │
│ 230       │ 14         │ 2011-10-08 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 0.99  │ Steve     │ Johnson  │
│ 351       │ 14         │ 2013-03-31 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 1.98  │ Steve     │ Johnson  │
│ 362       │ 14         │ 2013-05-11 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 13.86 │ Steve     │ Johnson  │
│ 14        │ 17         │ 2009-03-04 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 1.98  │ Steve     │ Johnson  │
│ 37        │ 17         │ 2009-06-06 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 3.96  │ Steve     │ Johnson  │
│ 59        │ 17         │ 2009-09-08 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 5.94  │ Steve     │ Johnson  │
│ 111       │ 17         │ 2010-04-29 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 0.99  │ Steve     │ Johnson  │
│ 232       │ 17         │ 2011-10-21 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 1.98  │ Steve     │ Johnson  │
│ 243       │ 17         │ 2011-12-01 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 13.86 │ Steve     │ Johnson  │
│ 298       │ 17         │ 2012-07-31 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 10.91 │ Steve     │ Johnson  │
│ 16        │ 21         │ 2009-03-05 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 3.96  │ Steve     │ Johnson  │
│ 38        │ 21         │ 2009-06-07 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 5.94  │ Steve     │ Johnson  │
│ 90        │ 21         │ 2010-01-26 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 0.99  │ Steve     │ Johnson  │
│ 211       │ 21         │ 2011-07-20 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 1.98  │ Steve     │ Johnson  │
│ 222       │ 21         │ 2011-08-30 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 13.86 │ Steve     │ Johnson  │
│ 277       │ 21         │ 2012-04-29 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 8.91  │ Steve     │ Johnson  │
│ 406       │ 21         │ 2013-12-04 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 1.98  │ Steve     │ Johnson  │
│ 17        │ 25         │ 2009-03-06 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 5.94  │ Steve     │ Johnson  │
│ 69        │ 25         │ 2009-10-25 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 0.99  │ Steve     │ Johnson  │
│ 190       │ 25         │ 2011-04-18 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 1.98  │ Steve     │ Johnson  │
│ 201       │ 25         │ 2011-05-29 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 18.86 │ Steve     │ Johnson  │
│ 256       │ 25         │ 2012-01-27 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 8.91  │ Steve     │ Johnson  │
│ 385       │ 25         │ 2013-09-02 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 1.98  │ Steve     │ Johnson  │
│ 408       │ 25         │ 2013-12-05 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 3.96  │ Steve     │ Johnson  │
│ 71        │ 28         │ 2009-11-07 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 1.98  │ Steve     │ Johnson  │
│ 82        │ 28         │ 2009-12-18 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 13.86 │ Steve     │ Johnson  │
│ 137       │ 28         │ 2010-08-18 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 8.91  │ Steve     │ Johnson  │
│ 266       │ 28         │ 2012-03-24 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 1.98  │ Steve     │ Johnson  │
│ 289       │ 28         │ 2012-06-26 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 3.96  │ Steve     │ Johnson  │
│ 311       │ 28         │ 2012-09-28 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 11.94 │ Steve     │ Johnson  │
│ 363       │ 28         │ 2013-05-19 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 0.99  │ Steve     │ Johnson  │
│ 18        │ 31         │ 2009-03-09 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 8.91  │ Steve     │ Johnson  │
│ 147       │ 31         │ 2010-10-14 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 1.98  │ Steve     │ Johnson  │
│ 170       │ 31         │ 2011-01-16 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 3.96  │ Steve     │ Johnson  │
│ 192       │ 31         │ 2011-04-20 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 5.94  │ Steve     │ Johnson  │
│ 244       │ 31         │ 2011-12-09 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 0.99  │ Steve     │ Johnson  │
│ 365       │ 31         │ 2013-06-01 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 1.98  │ Steve     │ Johnson  │
│ 376       │ 31         │ 2013-07-12 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 13.86 │ Steve     │ Johnson  │
│ 29        │ 36         │ 2009-05-05 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 1.98  │ Steve     │ Johnson  │
│ 40        │ 36         │ 2009-06-15 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 13.86 │ Steve     │ Johnson  │
│ 95        │ 36         │ 2010-02-13 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 8.91  │ Steve     │ Johnson  │
│ 224       │ 36         │ 2011-09-20 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 1.98  │ Steve     │ Johnson  │
│ 247       │ 36         │ 2011-12-23 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 3.96  │ Steve     │ Johnson  │
│ 269       │ 36         │ 2012-03-26 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 5.94  │ Steve     │ Johnson  │
│ 321       │ 36         │ 2012-11-14 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 0.99  │ Steve     │ Johnson  │
│ 106       │ 41         │ 2010-04-11 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 1.98  │ Steve     │ Johnson  │
│ 117       │ 41         │ 2010-05-22 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 13.86 │ Steve     │ Johnson  │
│ 172       │ 41         │ 2011-01-20 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 8.91  │ Steve     │ Johnson  │
│ 301       │ 41         │ 2012-08-26 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 1.98  │ Steve     │ Johnson  │
│ 324       │ 41         │ 2012-11-28 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 3.96  │ Steve     │ Johnson  │
│ 346       │ 41         │ 2013-03-02 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 5.94  │ Steve     │ Johnson  │
│ 398       │ 41         │ 2013-10-21 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 0.99  │ Steve     │ Johnson  │
│ 63        │ 47         │ 2009-10-07 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 1.98  │ Steve     │ Johnson  │
│ 86        │ 47         │ 2010-01-09 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 3.96  │ Steve     │ Johnson  │
│ 108       │ 47         │ 2010-04-13 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 5.94  │ Steve     │ Johnson  │
│ 160       │ 47         │ 2010-12-02 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 0.99  │ Steve     │ Johnson  │
│ 281       │ 47         │ 2012-05-25 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 1.98  │ Steve     │ Johnson  │
│ 292       │ 47         │ 2012-07-05 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 13.86 │ Steve     │ Johnson  │
│ 347       │ 47         │ 2013-03-05 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 8.91  │ Steve     │ Johnson  │
│ 32        │ 48         │ 2009-05-10 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 8.91  │ Steve     │ Johnson  │
│ 161       │ 48         │ 2010-12-15 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 1.98  │ Steve     │ Johnson  │
│ 184       │ 48         │ 2011-03-19 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 3.96  │ Steve     │ Johnson  │
│ 206       │ 48         │ 2011-06-21 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 8.94  │ Steve     │ Johnson  │
│ 258       │ 48         │ 2012-02-09 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 0.99  │ Steve     │ Johnson  │
│ 379       │ 48         │ 2013-08-02 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 1.98  │ Steve     │ Johnson  │
│ 390       │ 48         │ 2013-09-12 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 13.86 │ Steve     │ Johnson  │
│ 41        │ 50         │ 2009-06-23 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 0.99  │ Steve     │ Johnson  │
│ 162       │ 50         │ 2010-12-15 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 1.98  │ Steve     │ Johnson  │
│ 173       │ 50         │ 2011-01-25 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 13.86 │ Steve     │ Johnson  │
│ 228       │ 50         │ 2011-09-25 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 8.91  │ Steve     │ Johnson  │
│ 357       │ 50         │ 2013-05-01 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 1.98  │ Steve     │ Johnson  │
│ 380       │ 50         │ 2013-08-03 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 3.96  │ Steve     │ Johnson  │
│ 402       │ 50         │ 2013-11-05 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 5.94  │ Steve     │ Johnson  │
│ 42        │ 51         │ 2009-07-06 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 1.98  │ Steve     │ Johnson  │
│ 65        │ 51         │ 2009-10-08 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 3.96  │ Steve     │ Johnson  │
│ 87        │ 51         │ 2010-01-10 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 6.94  │ Steve     │ Johnson  │
│ 139       │ 51         │ 2010-08-31 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 0.99  │ Steve     │ Johnson  │
│ 260       │ 51         │ 2012-02-22 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 1.98  │ Steve     │ Johnson  │
│ 271       │ 51         │ 2012-04-03 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 13.86 │ Steve     │ Johnson  │
│ 326       │ 51         │ 2012-12-02 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 8.91  │ Steve     │ Johnson  │
│ 20        │ 54         │ 2009-03-22 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 0.99  │ Steve     │ Johnson  │
│ 141       │ 54         │ 2010-09-13 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 1.98  │ Steve     │ Johnson  │
│ 152       │ 54         │ 2010-10-24 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 13.86 │ Steve     │ Johnson  │
│ 207       │ 54         │ 2011-06-24 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 8.91  │ Steve     │ Johnson  │
│ 336       │ 54         │ 2013-01-28 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 1.98  │ Steve     │ Johnson  │
│ 359       │ 54         │ 2013-05-02 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 3.96  │ Steve     │ Johnson  │
│ 381       │ 54         │ 2013-08-04 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 5.94  │ Steve     │ Johnson  │
│ 22        │ 57         │ 2009-04-04 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 1.98  │ Steve     │ Johnson  │
│ 33        │ 57         │ 2009-05-15 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 13.86 │ Steve     │ Johnson  │
│ 88        │ 57         │ 2010-01-13 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 17.91 │ Steve     │ Johnson  │
│ 217       │ 57         │ 2011-08-20 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 1.98  │ Steve     │ Johnson  │
│ 240       │ 57         │ 2011-11-22 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 3.96  │ Steve     │ Johnson  │
│ 262       │ 57         │ 2012-02-24 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 5.94  │ Steve     │ Johnson  │
│ 314       │ 57         │ 2012-10-14 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 0.99  │ Steve     │ Johnson  │
└───────────┴────────────┴─────────────────────┴──────────────────────────────────────────┴─────────────────────┴──────────────┴────────────────┴───────────────────┴───────┴───────────┴──────────┘
**/

--Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y nombre del Agente de Ventas para todas las facturas y clientes.

--Consulta:
select i.Total, e.FirstName, e.LastName, c.FirstName, c.LastName, c.Country from invoices as i INNER JOIN customers as c, employees as e on c.SupportRepId=e.EmployeeId and c.CustomerId=i.CustomerId and Title='Sales Support Agent';

select i.Total, e.FirstName, e.LastName, c.FirstName, c.LastName, c.Country from customers as c, employees as e, invoices as i where c.SupportRepId=e.EmployeeId and c.CustomerId=i.CustomerId and e.Title='Sales Support Agent';

/**
┌───────┬───────────┬──────────┬───────────┬──────────────┬────────────────┐
│ Total │ FirstName │ LastName │ FirstName │   LastName   │    Country     │
├───────┼───────────┼──────────┼───────────┼──────────────┼────────────────┤
│ 3.98  │ Jane      │ Peacock  │ Luís      │ Gonçalves    │ Brazil         │
│ 3.96  │ Jane      │ Peacock  │ Luís      │ Gonçalves    │ Brazil         │
│ 5.94  │ Jane      │ Peacock  │ Luís      │ Gonçalves    │ Brazil         │
│ 0.99  │ Jane      │ Peacock  │ Luís      │ Gonçalves    │ Brazil         │
│ 1.98  │ Jane      │ Peacock  │ Luís      │ Gonçalves    │ Brazil         │
│ 13.86 │ Jane      │ Peacock  │ Luís      │ Gonçalves    │ Brazil         │
│ 8.91  │ Jane      │ Peacock  │ Luís      │ Gonçalves    │ Brazil         │
│ 3.98  │ Jane      │ Peacock  │ François  │ Tremblay     │ Canada         │
│ 13.86 │ Jane      │ Peacock  │ François  │ Tremblay     │ Canada         │
│ 8.91  │ Jane      │ Peacock  │ François  │ Tremblay     │ Canada         │
│ 1.98  │ Jane      │ Peacock  │ François  │ Tremblay     │ Canada         │
│ 3.96  │ Jane      │ Peacock  │ François  │ Tremblay     │ Canada         │
│ 5.94  │ Jane      │ Peacock  │ François  │ Tremblay     │ Canada         │
│ 0.99  │ Jane      │ Peacock  │ François  │ Tremblay     │ Canada         │
│ 0.99  │ Jane      │ Peacock  │ Roberto   │ Almeida      │ Brazil         │
│ 1.98  │ Jane      │ Peacock  │ Roberto   │ Almeida      │ Brazil         │
│ 13.86 │ Jane      │ Peacock  │ Roberto   │ Almeida      │ Brazil         │
│ 8.91  │ Jane      │ Peacock  │ Roberto   │ Almeida      │ Brazil         │
│ 1.98  │ Jane      │ Peacock  │ Roberto   │ Almeida      │ Brazil         │
│ 3.96  │ Jane      │ Peacock  │ Roberto   │ Almeida      │ Brazil         │
│ 5.94  │ Jane      │ Peacock  │ Roberto   │ Almeida      │ Brazil         │
│ 1.98  │ Jane      │ Peacock  │ Jennifer  │ Peterson     │ Canada         │
│ 13.86 │ Jane      │ Peacock  │ Jennifer  │ Peterson     │ Canada         │
│ 9.91  │ Jane      │ Peacock  │ Jennifer  │ Peterson     │ Canada         │
│ 1.98  │ Jane      │ Peacock  │ Jennifer  │ Peterson     │ Canada         │
│ 3.96  │ Jane      │ Peacock  │ Jennifer  │ Peterson     │ Canada         │
│ 5.94  │ Jane      │ Peacock  │ Jennifer  │ Peterson     │ Canada         │
│ 0.99  │ Jane      │ Peacock  │ Jennifer  │ Peterson     │ Canada         │
│ 1.98  │ Jane      │ Peacock  │ Michelle  │ Brooks       │ USA            │
│ 3.96  │ Jane      │ Peacock  │ Michelle  │ Brooks       │ USA            │
│ 5.94  │ Jane      │ Peacock  │ Michelle  │ Brooks       │ USA            │
│ 0.99  │ Jane      │ Peacock  │ Michelle  │ Brooks       │ USA            │
│ 1.98  │ Jane      │ Peacock  │ Michelle  │ Brooks       │ USA            │
│ 13.86 │ Jane      │ Peacock  │ Michelle  │ Brooks       │ USA            │
│ 8.91  │ Jane      │ Peacock  │ Michelle  │ Brooks       │ USA            │
│ 1.98  │ Jane      │ Peacock  │ Tim       │ Goyer        │ USA            │
│ 13.86 │ Jane      │ Peacock  │ Tim       │ Goyer        │ USA            │
│ 8.91  │ Jane      │ Peacock  │ Tim       │ Goyer        │ USA            │
│ 1.98  │ Jane      │ Peacock  │ Tim       │ Goyer        │ USA            │
│ 3.96  │ Jane      │ Peacock  │ Tim       │ Goyer        │ USA            │
│ 5.94  │ Jane      │ Peacock  │ Tim       │ Goyer        │ USA            │
│ 1.99  │ Jane      │ Peacock  │ Tim       │ Goyer        │ USA            │
│ 1.98  │ Jane      │ Peacock  │ Frank     │ Ralston      │ USA            │
│ 15.86 │ Jane      │ Peacock  │ Frank     │ Ralston      │ USA            │
│ 8.91  │ Jane      │ Peacock  │ Frank     │ Ralston      │ USA            │
│ 1.98  │ Jane      │ Peacock  │ Frank     │ Ralston      │ USA            │
│ 7.96  │ Jane      │ Peacock  │ Frank     │ Ralston      │ USA            │
│ 5.94  │ Jane      │ Peacock  │ Frank     │ Ralston      │ USA            │
│ 0.99  │ Jane      │ Peacock  │ Frank     │ Ralston      │ USA            │
│ 0.99  │ Jane      │ Peacock  │ Robert    │ Brown        │ Canada         │
│ 1.98  │ Jane      │ Peacock  │ Robert    │ Brown        │ Canada         │
│ 13.86 │ Jane      │ Peacock  │ Robert    │ Brown        │ Canada         │
│ 8.91  │ Jane      │ Peacock  │ Robert    │ Brown        │ Canada         │
│ 1.98  │ Jane      │ Peacock  │ Robert    │ Brown        │ Canada         │
│ 3.96  │ Jane      │ Peacock  │ Robert    │ Brown        │ Canada         │
│ 5.94  │ Jane      │ Peacock  │ Robert    │ Brown        │ Canada         │
│ 1.98  │ Jane      │ Peacock  │ Edward    │ Francis      │ Canada         │
│ 3.96  │ Jane      │ Peacock  │ Edward    │ Francis      │ Canada         │
│ 5.94  │ Jane      │ Peacock  │ Edward    │ Francis      │ Canada         │
│ 0.99  │ Jane      │ Peacock  │ Edward    │ Francis      │ Canada         │
│ 1.98  │ Jane      │ Peacock  │ Edward    │ Francis      │ Canada         │
│ 13.86 │ Jane      │ Peacock  │ Edward    │ Francis      │ Canada         │
│ 8.91  │ Jane      │ Peacock  │ Edward    │ Francis      │ Canada         │
│ 0.99  │ Jane      │ Peacock  │ Ellie     │ Sullivan     │ Canada         │
│ 1.98  │ Jane      │ Peacock  │ Ellie     │ Sullivan     │ Canada         │
│ 13.86 │ Jane      │ Peacock  │ Ellie     │ Sullivan     │ Canada         │
│ 8.91  │ Jane      │ Peacock  │ Ellie     │ Sullivan     │ Canada         │
│ 1.98  │ Jane      │ Peacock  │ Ellie     │ Sullivan     │ Canada         │
│ 3.96  │ Jane      │ Peacock  │ Ellie     │ Sullivan     │ Canada         │
│ 5.94  │ Jane      │ Peacock  │ Ellie     │ Sullivan     │ Canada         │
│ 0.99  │ Jane      │ Peacock  │ Fynn      │ Zimmermann   │ Germany        │
│ 1.98  │ Jane      │ Peacock  │ Fynn      │ Zimmermann   │ Germany        │
│ 13.86 │ Jane      │ Peacock  │ Fynn      │ Zimmermann   │ Germany        │
│ 14.91 │ Jane      │ Peacock  │ Fynn      │ Zimmermann   │ Germany        │
│ 1.98  │ Jane      │ Peacock  │ Fynn      │ Zimmermann   │ Germany        │
│ 3.96  │ Jane      │ Peacock  │ Fynn      │ Zimmermann   │ Germany        │
│ 5.94  │ Jane      │ Peacock  │ Fynn      │ Zimmermann   │ Germany        │
│ 1.98  │ Jane      │ Peacock  │ Niklas    │ Schröder     │ Germany        │
│ 3.96  │ Jane      │ Peacock  │ Niklas    │ Schröder     │ Germany        │
│ 5.94  │ Jane      │ Peacock  │ Niklas    │ Schröder     │ Germany        │
│ 0.99  │ Jane      │ Peacock  │ Niklas    │ Schröder     │ Germany        │
│ 1.98  │ Jane      │ Peacock  │ Niklas    │ Schröder     │ Germany        │
│ 13.86 │ Jane      │ Peacock  │ Niklas    │ Schröder     │ Germany        │
│ 8.91  │ Jane      │ Peacock  │ Niklas    │ Schröder     │ Germany        │
│ 3.96  │ Jane      │ Peacock  │ Wyatt     │ Girard       │ France         │
│ 5.94  │ Jane      │ Peacock  │ Wyatt     │ Girard       │ France         │
│ 0.99  │ Jane      │ Peacock  │ Wyatt     │ Girard       │ France         │
│ 3.98  │ Jane      │ Peacock  │ Wyatt     │ Girard       │ France         │
│ 13.86 │ Jane      │ Peacock  │ Wyatt     │ Girard       │ France         │
│ 8.91  │ Jane      │ Peacock  │ Wyatt     │ Girard       │ France         │
│ 1.98  │ Jane      │ Peacock  │ Wyatt     │ Girard       │ France         │
│ 1.98  │ Jane      │ Peacock  │ Isabelle  │ Mercier      │ France         │
│ 3.96  │ Jane      │ Peacock  │ Isabelle  │ Mercier      │ France         │
│ 5.94  │ Jane      │ Peacock  │ Isabelle  │ Mercier      │ France         │
│ 0.99  │ Jane      │ Peacock  │ Isabelle  │ Mercier      │ France         │
│ 1.98  │ Jane      │ Peacock  │ Isabelle  │ Mercier      │ France         │
│ 16.86 │ Jane      │ Peacock  │ Isabelle  │ Mercier      │ France         │
│ 8.91  │ Jane      │ Peacock  │ Isabelle  │ Mercier      │ France         │
│ 8.91  │ Jane      │ Peacock  │ Terhi     │ Hämäläinen   │ Finland        │
│ 1.98  │ Jane      │ Peacock  │ Terhi     │ Hämäläinen   │ Finland        │
│ 7.96  │ Jane      │ Peacock  │ Terhi     │ Hämäläinen   │ Finland        │
│ 5.94  │ Jane      │ Peacock  │ Terhi     │ Hämäläinen   │ Finland        │
│ 0.99  │ Jane      │ Peacock  │ Terhi     │ Hämäläinen   │ Finland        │
│ 1.98  │ Jane      │ Peacock  │ Terhi     │ Hämäläinen   │ Finland        │
│ 13.86 │ Jane      │ Peacock  │ Terhi     │ Hämäläinen   │ Finland        │
│ 1.98  │ Jane      │ Peacock  │ Ladislav  │ Kovács       │ Hungary        │
│ 21.86 │ Jane      │ Peacock  │ Ladislav  │ Kovács       │ Hungary        │
│ 8.91  │ Jane      │ Peacock  │ Ladislav  │ Kovács       │ Hungary        │
│ 1.98  │ Jane      │ Peacock  │ Ladislav  │ Kovács       │ Hungary        │
│ 3.96  │ Jane      │ Peacock  │ Ladislav  │ Kovács       │ Hungary        │
│ 5.94  │ Jane      │ Peacock  │ Ladislav  │ Kovács       │ Hungary        │
│ 0.99  │ Jane      │ Peacock  │ Ladislav  │ Kovács       │ Hungary        │
│ 5.94  │ Jane      │ Peacock  │ Hugh      │ O'Reilly     │ Ireland        │
│ 0.99  │ Jane      │ Peacock  │ Hugh      │ O'Reilly     │ Ireland        │
│ 1.98  │ Jane      │ Peacock  │ Hugh      │ O'Reilly     │ Ireland        │
│ 21.86 │ Jane      │ Peacock  │ Hugh      │ O'Reilly     │ Ireland        │
│ 8.91  │ Jane      │ Peacock  │ Hugh      │ O'Reilly     │ Ireland        │
│ 1.98  │ Jane      │ Peacock  │ Hugh      │ O'Reilly     │ Ireland        │
│ 3.96  │ Jane      │ Peacock  │ Hugh      │ O'Reilly     │ Ireland        │
│ 8.91  │ Jane      │ Peacock  │ Emma      │ Jones        │ United Kingdom │
│ 1.98  │ Jane      │ Peacock  │ Emma      │ Jones        │ United Kingdom │
│ 3.96  │ Jane      │ Peacock  │ Emma      │ Jones        │ United Kingdom │
│ 5.94  │ Jane      │ Peacock  │ Emma      │ Jones        │ United Kingdom │
│ 0.99  │ Jane      │ Peacock  │ Emma      │ Jones        │ United Kingdom │
│ 1.98  │ Jane      │ Peacock  │ Emma      │ Jones        │ United Kingdom │
│ 13.86 │ Jane      │ Peacock  │ Emma      │ Jones        │ United Kingdom │
│ 1.98  │ Jane      │ Peacock  │ Phil      │ Hughes       │ United Kingdom │
│ 13.86 │ Jane      │ Peacock  │ Phil      │ Hughes       │ United Kingdom │
│ 8.91  │ Jane      │ Peacock  │ Phil      │ Hughes       │ United Kingdom │
│ 1.98  │ Jane      │ Peacock  │ Phil      │ Hughes       │ United Kingdom │
│ 3.96  │ Jane      │ Peacock  │ Phil      │ Hughes       │ United Kingdom │
│ 5.94  │ Jane      │ Peacock  │ Phil      │ Hughes       │ United Kingdom │
│ 0.99  │ Jane      │ Peacock  │ Phil      │ Hughes       │ United Kingdom │
│ 1.98  │ Jane      │ Peacock  │ Manoj     │ Pareek       │ India          │
│ 13.86 │ Jane      │ Peacock  │ Manoj     │ Pareek       │ India          │
│ 8.91  │ Jane      │ Peacock  │ Manoj     │ Pareek       │ India          │
│ 1.98  │ Jane      │ Peacock  │ Manoj     │ Pareek       │ India          │
│ 3.96  │ Jane      │ Peacock  │ Manoj     │ Pareek       │ India          │
│ 5.94  │ Jane      │ Peacock  │ Manoj     │ Pareek       │ India          │
│ 1.99  │ Jane      │ Peacock  │ Manoj     │ Pareek       │ India          │
│ 3.96  │ Jane      │ Peacock  │ Puja      │ Srivastava   │ India          │
│ 5.94  │ Jane      │ Peacock  │ Puja      │ Srivastava   │ India          │
│ 1.99  │ Jane      │ Peacock  │ Puja      │ Srivastava   │ India          │
│ 1.98  │ Jane      │ Peacock  │ Puja      │ Srivastava   │ India          │
│ 13.86 │ Jane      │ Peacock  │ Puja      │ Srivastava   │ India          │
│ 8.91  │ Jane      │ Peacock  │ Puja      │ Srivastava   │ India          │
│ 3.96  │ Margaret  │ Park     │ Bjørn     │ Hansen       │ Norway         │
│ 5.94  │ Margaret  │ Park     │ Bjørn     │ Hansen       │ Norway         │
│ 0.99  │ Margaret  │ Park     │ Bjørn     │ Hansen       │ Norway         │
│ 1.98  │ Margaret  │ Park     │ Bjørn     │ Hansen       │ Norway         │
│ 15.86 │ Margaret  │ Park     │ Bjørn     │ Hansen       │ Norway         │
│ 8.91  │ Margaret  │ Park     │ Bjørn     │ Hansen       │ Norway         │
│ 1.98  │ Margaret  │ Park     │ Bjørn     │ Hansen       │ Norway         │
│ 1.98  │ Margaret  │ Park     │ František │ Wichterlová  │ Czech Republic │
│ 3.96  │ Margaret  │ Park     │ František │ Wichterlová  │ Czech Republic │
│ 5.94  │ Margaret  │ Park     │ František │ Wichterlová  │ Czech Republic │
│ 0.99  │ Margaret  │ Park     │ František │ Wichterlová  │ Czech Republic │
│ 1.98  │ Margaret  │ Park     │ František │ Wichterlová  │ Czech Republic │
│ 16.86 │ Margaret  │ Park     │ František │ Wichterlová  │ Czech Republic │
│ 8.91  │ Margaret  │ Park     │ František │ Wichterlová  │ Czech Republic │
│ 5.94  │ Margaret  │ Park     │ Daan      │ Peeters      │ Belgium        │
│ 0.99  │ Margaret  │ Park     │ Daan      │ Peeters      │ Belgium        │
│ 1.98  │ Margaret  │ Park     │ Daan      │ Peeters      │ Belgium        │
│ 13.86 │ Margaret  │ Park     │ Daan      │ Peeters      │ Belgium        │
│ 8.91  │ Margaret  │ Park     │ Daan      │ Peeters      │ Belgium        │
│ 1.98  │ Margaret  │ Park     │ Daan      │ Peeters      │ Belgium        │
│ 3.96  │ Margaret  │ Park     │ Daan      │ Peeters      │ Belgium        │
│ 1.98  │ Margaret  │ Park     │ Kara      │ Nielsen      │ Denmark        │
│ 3.96  │ Margaret  │ Park     │ Kara      │ Nielsen      │ Denmark        │
│ 5.94  │ Margaret  │ Park     │ Kara      │ Nielsen      │ Denmark        │
│ 0.99  │ Margaret  │ Park     │ Kara      │ Nielsen      │ Denmark        │
│ 1.98  │ Margaret  │ Park     │ Kara      │ Nielsen      │ Denmark        │
│ 13.86 │ Margaret  │ Park     │ Kara      │ Nielsen      │ Denmark        │
│ 8.91  │ Margaret  │ Park     │ Kara      │ Nielsen      │ Denmark        │
│ 8.91  │ Margaret  │ Park     │ Eduardo   │ Martins      │ Brazil         │
│ 1.98  │ Margaret  │ Park     │ Eduardo   │ Martins      │ Brazil         │
│ 3.96  │ Margaret  │ Park     │ Eduardo   │ Martins      │ Brazil         │
│ 5.94  │ Margaret  │ Park     │ Eduardo   │ Martins      │ Brazil         │
│ 0.99  │ Margaret  │ Park     │ Eduardo   │ Martins      │ Brazil         │
│ 1.98  │ Margaret  │ Park     │ Eduardo   │ Martins      │ Brazil         │
│ 13.86 │ Margaret  │ Park     │ Eduardo   │ Martins      │ Brazil         │
│ 1.98  │ Margaret  │ Park     │ Fernanda  │ Ramos        │ Brazil         │
│ 3.96  │ Margaret  │ Park     │ Fernanda  │ Ramos        │ Brazil         │
│ 5.94  │ Margaret  │ Park     │ Fernanda  │ Ramos        │ Brazil         │
│ 0.99  │ Margaret  │ Park     │ Fernanda  │ Ramos        │ Brazil         │
│ 1.98  │ Margaret  │ Park     │ Fernanda  │ Ramos        │ Brazil         │
│ 13.86 │ Margaret  │ Park     │ Fernanda  │ Ramos        │ Brazil         │
│ 8.91  │ Margaret  │ Park     │ Fernanda  │ Ramos        │ Brazil         │
│ 0.99  │ Margaret  │ Park     │ Frank     │ Harris       │ USA            │
│ 1.98  │ Margaret  │ Park     │ Frank     │ Harris       │ USA            │
│ 13.86 │ Margaret  │ Park     │ Frank     │ Harris       │ USA            │
│ 8.91  │ Margaret  │ Park     │ Frank     │ Harris       │ USA            │
│ 1.98  │ Margaret  │ Park     │ Frank     │ Harris       │ USA            │
│ 3.96  │ Margaret  │ Park     │ Frank     │ Harris       │ USA            │
│ 5.94  │ Margaret  │ Park     │ Frank     │ Harris       │ USA            │
│ 1.98  │ Margaret  │ Park     │ Dan       │ Miller       │ USA            │
│ 13.86 │ Margaret  │ Park     │ Dan       │ Miller       │ USA            │
│ 8.91  │ Margaret  │ Park     │ Dan       │ Miller       │ USA            │
│ 3.98  │ Margaret  │ Park     │ Dan       │ Miller       │ USA            │
│ 3.96  │ Margaret  │ Park     │ Dan       │ Miller       │ USA            │
│ 5.94  │ Margaret  │ Park     │ Dan       │ Miller       │ USA            │
│ 0.99  │ Margaret  │ Park     │ Dan       │ Miller       │ USA            │
│ 1.98  │ Margaret  │ Park     │ Heather   │ Leacock      │ USA            │
│ 3.96  │ Margaret  │ Park     │ Heather   │ Leacock      │ USA            │
│ 5.94  │ Margaret  │ Park     │ Heather   │ Leacock      │ USA            │
│ 0.99  │ Margaret  │ Park     │ Heather   │ Leacock      │ USA            │
│ 3.98  │ Margaret  │ Park     │ Heather   │ Leacock      │ USA            │
│ 13.86 │ Margaret  │ Park     │ Heather   │ Leacock      │ USA            │
│ 8.91  │ Margaret  │ Park     │ Heather   │ Leacock      │ USA            │
│ 13.86 │ Margaret  │ Park     │ John      │ Gordon       │ USA            │
│ 8.91  │ Margaret  │ Park     │ John      │ Gordon       │ USA            │
│ 1.98  │ Margaret  │ Park     │ John      │ Gordon       │ USA            │
│ 3.96  │ Margaret  │ Park     │ John      │ Gordon       │ USA            │
│ 5.94  │ Margaret  │ Park     │ John      │ Gordon       │ USA            │
│ 0.99  │ Margaret  │ Park     │ John      │ Gordon       │ USA            │
│ 1.98  │ Margaret  │ Park     │ John      │ Gordon       │ USA            │
│ 1.98  │ Margaret  │ Park     │ Richard   │ Cunningham   │ USA            │
│ 3.96  │ Margaret  │ Park     │ Richard   │ Cunningham   │ USA            │
│ 5.94  │ Margaret  │ Park     │ Richard   │ Cunningham   │ USA            │
│ 0.99  │ Margaret  │ Park     │ Richard   │ Cunningham   │ USA            │
│ 1.98  │ Margaret  │ Park     │ Richard   │ Cunningham   │ USA            │
│ 23.86 │ Margaret  │ Park     │ Richard   │ Cunningham   │ USA            │
│ 8.91  │ Margaret  │ Park     │ Richard   │ Cunningham   │ USA            │
│ 8.91  │ Margaret  │ Park     │ Patrick   │ Gray         │ USA            │
│ 1.98  │ Margaret  │ Park     │ Patrick   │ Gray         │ USA            │
│ 3.96  │ Margaret  │ Park     │ Patrick   │ Gray         │ USA            │
│ 5.94  │ Margaret  │ Park     │ Patrick   │ Gray         │ USA            │
│ 0.99  │ Margaret  │ Park     │ Patrick   │ Gray         │ USA            │
│ 1.98  │ Margaret  │ Park     │ Patrick   │ Gray         │ USA            │
│ 13.86 │ Margaret  │ Park     │ Patrick   │ Gray         │ USA            │
│ 1.98  │ Margaret  │ Park     │ Aaron     │ Mitchell     │ Canada         │
│ 13.86 │ Margaret  │ Park     │ Aaron     │ Mitchell     │ Canada         │
│ 8.91  │ Margaret  │ Park     │ Aaron     │ Mitchell     │ Canada         │
│ 1.98  │ Margaret  │ Park     │ Aaron     │ Mitchell     │ Canada         │
│ 3.96  │ Margaret  │ Park     │ Aaron     │ Mitchell     │ Canada         │
│ 5.94  │ Margaret  │ Park     │ Aaron     │ Mitchell     │ Canada         │
│ 0.99  │ Margaret  │ Park     │ Aaron     │ Mitchell     │ Canada         │
│ 1.98  │ Margaret  │ Park     │ João      │ Fernandes    │ Portugal       │
│ 3.96  │ Margaret  │ Park     │ João      │ Fernandes    │ Portugal       │
│ 5.94  │ Margaret  │ Park     │ João      │ Fernandes    │ Portugal       │
│ 0.99  │ Margaret  │ Park     │ João      │ Fernandes    │ Portugal       │
│ 1.98  │ Margaret  │ Park     │ João      │ Fernandes    │ Portugal       │
│ 13.86 │ Margaret  │ Park     │ João      │ Fernandes    │ Portugal       │
│ 10.91 │ Margaret  │ Park     │ João      │ Fernandes    │ Portugal       │
│ 1.98  │ Margaret  │ Park     │ Madalena  │ Sampaio      │ Portugal       │
│ 3.96  │ Margaret  │ Park     │ Madalena  │ Sampaio      │ Portugal       │
│ 5.94  │ Margaret  │ Park     │ Madalena  │ Sampaio      │ Portugal       │
│ 0.99  │ Margaret  │ Park     │ Madalena  │ Sampaio      │ Portugal       │
│ 1.98  │ Margaret  │ Park     │ Madalena  │ Sampaio      │ Portugal       │
│ 13.86 │ Margaret  │ Park     │ Madalena  │ Sampaio      │ Portugal       │
│ 8.91  │ Margaret  │ Park     │ Madalena  │ Sampaio      │ Portugal       │
│ 1.98  │ Margaret  │ Park     │ Camille   │ Bernard      │ France         │
│ 3.96  │ Margaret  │ Park     │ Camille   │ Bernard      │ France         │
│ 5.94  │ Margaret  │ Park     │ Camille   │ Bernard      │ France         │
│ 1.99  │ Margaret  │ Park     │ Camille   │ Bernard      │ France         │
│ 1.98  │ Margaret  │ Park     │ Camille   │ Bernard      │ France         │
│ 13.86 │ Margaret  │ Park     │ Camille   │ Bernard      │ France         │
│ 8.91  │ Margaret  │ Park     │ Camille   │ Bernard      │ France         │
│ 1.98  │ Margaret  │ Park     │ Dominique │ Lefebvre     │ France         │
│ 13.86 │ Margaret  │ Park     │ Dominique │ Lefebvre     │ France         │
│ 8.91  │ Margaret  │ Park     │ Dominique │ Lefebvre     │ France         │
│ 2.98  │ Margaret  │ Park     │ Dominique │ Lefebvre     │ France         │
│ 3.96  │ Margaret  │ Park     │ Dominique │ Lefebvre     │ France         │
│ 5.94  │ Margaret  │ Park     │ Dominique │ Lefebvre     │ France         │
│ 0.99  │ Margaret  │ Park     │ Dominique │ Lefebvre     │ France         │
│ 1.98  │ Margaret  │ Park     │ Stanisław │ Wójcik       │ Poland         │
│ 13.86 │ Margaret  │ Park     │ Stanisław │ Wójcik       │ Poland         │
│ 8.91  │ Margaret  │ Park     │ Stanisław │ Wójcik       │ Poland         │
│ 1.98  │ Margaret  │ Park     │ Stanisław │ Wójcik       │ Poland         │
│ 3.96  │ Margaret  │ Park     │ Stanisław │ Wójcik       │ Poland         │
│ 5.94  │ Margaret  │ Park     │ Stanisław │ Wójcik       │ Poland         │
│ 0.99  │ Margaret  │ Park     │ Stanisław │ Wójcik       │ Poland         │
│ 1.98  │ Margaret  │ Park     │ Mark      │ Taylor       │ Australia      │
│ 3.96  │ Margaret  │ Park     │ Mark      │ Taylor       │ Australia      │
│ 5.94  │ Margaret  │ Park     │ Mark      │ Taylor       │ Australia      │
│ 0.99  │ Margaret  │ Park     │ Mark      │ Taylor       │ Australia      │
│ 1.98  │ Margaret  │ Park     │ Mark      │ Taylor       │ Australia      │
│ 13.86 │ Margaret  │ Park     │ Mark      │ Taylor       │ Australia      │
│ 8.91  │ Margaret  │ Park     │ Mark      │ Taylor       │ Australia      │
│ 1.98  │ Margaret  │ Park     │ Diego     │ Gutiérrez    │ Argentina      │
│ 3.96  │ Margaret  │ Park     │ Diego     │ Gutiérrez    │ Argentina      │
│ 5.94  │ Margaret  │ Park     │ Diego     │ Gutiérrez    │ Argentina      │
│ 0.99  │ Margaret  │ Park     │ Diego     │ Gutiérrez    │ Argentina      │
│ 1.98  │ Margaret  │ Park     │ Diego     │ Gutiérrez    │ Argentina      │
│ 13.86 │ Margaret  │ Park     │ Diego     │ Gutiérrez    │ Argentina      │
│ 8.91  │ Margaret  │ Park     │ Diego     │ Gutiérrez    │ Argentina      │
│ 1.98  │ Steve     │ Johnson  │ Leonie    │ Köhler       │ Germany        │
│ 13.86 │ Steve     │ Johnson  │ Leonie    │ Köhler       │ Germany        │
│ 8.91  │ Steve     │ Johnson  │ Leonie    │ Köhler       │ Germany        │
│ 1.98  │ Steve     │ Johnson  │ Leonie    │ Köhler       │ Germany        │
│ 3.96  │ Steve     │ Johnson  │ Leonie    │ Köhler       │ Germany        │
│ 5.94  │ Steve     │ Johnson  │ Leonie    │ Köhler       │ Germany        │
│ 0.99  │ Steve     │ Johnson  │ Leonie    │ Köhler       │ Germany        │
│ 8.91  │ Steve     │ Johnson  │ Helena    │ Holý         │ Czech Republic │
│ 1.98  │ Steve     │ Johnson  │ Helena    │ Holý         │ Czech Republic │
│ 3.96  │ Steve     │ Johnson  │ Helena    │ Holý         │ Czech Republic │
│ 5.94  │ Steve     │ Johnson  │ Helena    │ Holý         │ Czech Republic │
│ 0.99  │ Steve     │ Johnson  │ Helena    │ Holý         │ Czech Republic │
│ 1.98  │ Steve     │ Johnson  │ Helena    │ Holý         │ Czech Republic │
│ 25.86 │ Steve     │ Johnson  │ Helena    │ Holý         │ Czech Republic │
│ 1.98  │ Steve     │ Johnson  │ Astrid    │ Gruber       │ Austria        │
│ 18.86 │ Steve     │ Johnson  │ Astrid    │ Gruber       │ Austria        │
│ 8.91  │ Steve     │ Johnson  │ Astrid    │ Gruber       │ Austria        │
│ 1.98  │ Steve     │ Johnson  │ Astrid    │ Gruber       │ Austria        │
│ 3.96  │ Steve     │ Johnson  │ Astrid    │ Gruber       │ Austria        │
│ 5.94  │ Steve     │ Johnson  │ Astrid    │ Gruber       │ Austria        │
│ 0.99  │ Steve     │ Johnson  │ Astrid    │ Gruber       │ Austria        │
│ 1.98  │ Steve     │ Johnson  │ Alexandre │ Rocha        │ Brazil         │
│ 13.86 │ Steve     │ Johnson  │ Alexandre │ Rocha        │ Brazil         │
│ 8.91  │ Steve     │ Johnson  │ Alexandre │ Rocha        │ Brazil         │
│ 1.98  │ Steve     │ Johnson  │ Alexandre │ Rocha        │ Brazil         │
│ 3.96  │ Steve     │ Johnson  │ Alexandre │ Rocha        │ Brazil         │
│ 5.94  │ Steve     │ Johnson  │ Alexandre │ Rocha        │ Brazil         │
│ 0.99  │ Steve     │ Johnson  │ Alexandre │ Rocha        │ Brazil         │
│ 8.91  │ Steve     │ Johnson  │ Mark      │ Philips      │ Canada         │
│ 1.98  │ Steve     │ Johnson  │ Mark      │ Philips      │ Canada         │
│ 3.96  │ Steve     │ Johnson  │ Mark      │ Philips      │ Canada         │
│ 5.94  │ Steve     │ Johnson  │ Mark      │ Philips      │ Canada         │
│ 0.99  │ Steve     │ Johnson  │ Mark      │ Philips      │ Canada         │
│ 1.98  │ Steve     │ Johnson  │ Mark      │ Philips      │ Canada         │
│ 13.86 │ Steve     │ Johnson  │ Mark      │ Philips      │ Canada         │
│ 1.98  │ Steve     │ Johnson  │ Jack      │ Smith        │ USA            │
│ 3.96  │ Steve     │ Johnson  │ Jack      │ Smith        │ USA            │
│ 5.94  │ Steve     │ Johnson  │ Jack      │ Smith        │ USA            │
│ 0.99  │ Steve     │ Johnson  │ Jack      │ Smith        │ USA            │
│ 1.98  │ Steve     │ Johnson  │ Jack      │ Smith        │ USA            │
│ 13.86 │ Steve     │ Johnson  │ Jack      │ Smith        │ USA            │
│ 10.91 │ Steve     │ Johnson  │ Jack      │ Smith        │ USA            │
│ 3.96  │ Steve     │ Johnson  │ Kathy     │ Chase        │ USA            │
│ 5.94  │ Steve     │ Johnson  │ Kathy     │ Chase        │ USA            │
│ 0.99  │ Steve     │ Johnson  │ Kathy     │ Chase        │ USA            │
│ 1.98  │ Steve     │ Johnson  │ Kathy     │ Chase        │ USA            │
│ 13.86 │ Steve     │ Johnson  │ Kathy     │ Chase        │ USA            │
│ 8.91  │ Steve     │ Johnson  │ Kathy     │ Chase        │ USA            │
│ 1.98  │ Steve     │ Johnson  │ Kathy     │ Chase        │ USA            │
│ 5.94  │ Steve     │ Johnson  │ Victor    │ Stevens      │ USA            │
│ 0.99  │ Steve     │ Johnson  │ Victor    │ Stevens      │ USA            │
│ 1.98  │ Steve     │ Johnson  │ Victor    │ Stevens      │ USA            │
│ 18.86 │ Steve     │ Johnson  │ Victor    │ Stevens      │ USA            │
│ 8.91  │ Steve     │ Johnson  │ Victor    │ Stevens      │ USA            │
│ 1.98  │ Steve     │ Johnson  │ Victor    │ Stevens      │ USA            │
│ 3.96  │ Steve     │ Johnson  │ Victor    │ Stevens      │ USA            │
│ 1.98  │ Steve     │ Johnson  │ Julia     │ Barnett      │ USA            │
│ 13.86 │ Steve     │ Johnson  │ Julia     │ Barnett      │ USA            │
│ 8.91  │ Steve     │ Johnson  │ Julia     │ Barnett      │ USA            │
│ 1.98  │ Steve     │ Johnson  │ Julia     │ Barnett      │ USA            │
│ 3.96  │ Steve     │ Johnson  │ Julia     │ Barnett      │ USA            │
│ 11.94 │ Steve     │ Johnson  │ Julia     │ Barnett      │ USA            │
│ 0.99  │ Steve     │ Johnson  │ Julia     │ Barnett      │ USA            │
│ 8.91  │ Steve     │ Johnson  │ Martha    │ Silk         │ Canada         │
│ 1.98  │ Steve     │ Johnson  │ Martha    │ Silk         │ Canada         │
│ 3.96  │ Steve     │ Johnson  │ Martha    │ Silk         │ Canada         │
│ 5.94  │ Steve     │ Johnson  │ Martha    │ Silk         │ Canada         │
│ 0.99  │ Steve     │ Johnson  │ Martha    │ Silk         │ Canada         │
│ 1.98  │ Steve     │ Johnson  │ Martha    │ Silk         │ Canada         │
│ 13.86 │ Steve     │ Johnson  │ Martha    │ Silk         │ Canada         │
│ 1.98  │ Steve     │ Johnson  │ Hannah    │ Schneider    │ Germany        │
│ 13.86 │ Steve     │ Johnson  │ Hannah    │ Schneider    │ Germany        │
│ 8.91  │ Steve     │ Johnson  │ Hannah    │ Schneider    │ Germany        │
│ 1.98  │ Steve     │ Johnson  │ Hannah    │ Schneider    │ Germany        │
│ 3.96  │ Steve     │ Johnson  │ Hannah    │ Schneider    │ Germany        │
│ 5.94  │ Steve     │ Johnson  │ Hannah    │ Schneider    │ Germany        │
│ 0.99  │ Steve     │ Johnson  │ Hannah    │ Schneider    │ Germany        │
│ 1.98  │ Steve     │ Johnson  │ Marc      │ Dubois       │ France         │
│ 13.86 │ Steve     │ Johnson  │ Marc      │ Dubois       │ France         │
│ 8.91  │ Steve     │ Johnson  │ Marc      │ Dubois       │ France         │
│ 1.98  │ Steve     │ Johnson  │ Marc      │ Dubois       │ France         │
│ 3.96  │ Steve     │ Johnson  │ Marc      │ Dubois       │ France         │
│ 5.94  │ Steve     │ Johnson  │ Marc      │ Dubois       │ France         │
│ 0.99  │ Steve     │ Johnson  │ Marc      │ Dubois       │ France         │
│ 1.98  │ Steve     │ Johnson  │ Lucas     │ Mancini      │ Italy          │
│ 3.96  │ Steve     │ Johnson  │ Lucas     │ Mancini      │ Italy          │
│ 5.94  │ Steve     │ Johnson  │ Lucas     │ Mancini      │ Italy          │
│ 0.99  │ Steve     │ Johnson  │ Lucas     │ Mancini      │ Italy          │
│ 1.98  │ Steve     │ Johnson  │ Lucas     │ Mancini      │ Italy          │
│ 13.86 │ Steve     │ Johnson  │ Lucas     │ Mancini      │ Italy          │
│ 8.91  │ Steve     │ Johnson  │ Lucas     │ Mancini      │ Italy          │
│ 8.91  │ Steve     │ Johnson  │ Johannes  │ Van der Berg │ Netherlands    │
│ 1.98  │ Steve     │ Johnson  │ Johannes  │ Van der Berg │ Netherlands    │
│ 3.96  │ Steve     │ Johnson  │ Johannes  │ Van der Berg │ Netherlands    │
│ 8.94  │ Steve     │ Johnson  │ Johannes  │ Van der Berg │ Netherlands    │
│ 0.99  │ Steve     │ Johnson  │ Johannes  │ Van der Berg │ Netherlands    │
│ 1.98  │ Steve     │ Johnson  │ Johannes  │ Van der Berg │ Netherlands    │
│ 13.86 │ Steve     │ Johnson  │ Johannes  │ Van der Berg │ Netherlands    │
│ 0.99  │ Steve     │ Johnson  │ Enrique   │ Muñoz        │ Spain          │
│ 1.98  │ Steve     │ Johnson  │ Enrique   │ Muñoz        │ Spain          │
│ 13.86 │ Steve     │ Johnson  │ Enrique   │ Muñoz        │ Spain          │
│ 8.91  │ Steve     │ Johnson  │ Enrique   │ Muñoz        │ Spain          │
│ 1.98  │ Steve     │ Johnson  │ Enrique   │ Muñoz        │ Spain          │
│ 3.96  │ Steve     │ Johnson  │ Enrique   │ Muñoz        │ Spain          │
│ 5.94  │ Steve     │ Johnson  │ Enrique   │ Muñoz        │ Spain          │
│ 1.98  │ Steve     │ Johnson  │ Joakim    │ Johansson    │ Sweden         │
│ 3.96  │ Steve     │ Johnson  │ Joakim    │ Johansson    │ Sweden         │
│ 6.94  │ Steve     │ Johnson  │ Joakim    │ Johansson    │ Sweden         │
│ 0.99  │ Steve     │ Johnson  │ Joakim    │ Johansson    │ Sweden         │
│ 1.98  │ Steve     │ Johnson  │ Joakim    │ Johansson    │ Sweden         │
│ 13.86 │ Steve     │ Johnson  │ Joakim    │ Johansson    │ Sweden         │
│ 8.91  │ Steve     │ Johnson  │ Joakim    │ Johansson    │ Sweden         │
│ 0.99  │ Steve     │ Johnson  │ Steve     │ Murray       │ United Kingdom │
│ 1.98  │ Steve     │ Johnson  │ Steve     │ Murray       │ United Kingdom │
│ 13.86 │ Steve     │ Johnson  │ Steve     │ Murray       │ United Kingdom │
│ 8.91  │ Steve     │ Johnson  │ Steve     │ Murray       │ United Kingdom │
│ 1.98  │ Steve     │ Johnson  │ Steve     │ Murray       │ United Kingdom │
│ 3.96  │ Steve     │ Johnson  │ Steve     │ Murray       │ United Kingdom │
│ 5.94  │ Steve     │ Johnson  │ Steve     │ Murray       │ United Kingdom │
│ 1.98  │ Steve     │ Johnson  │ Luis      │ Rojas        │ Chile          │
│ 13.86 │ Steve     │ Johnson  │ Luis      │ Rojas        │ Chile          │
│ 17.91 │ Steve     │ Johnson  │ Luis      │ Rojas        │ Chile          │
│ 1.98  │ Steve     │ Johnson  │ Luis      │ Rojas        │ Chile          │
│ 3.96  │ Steve     │ Johnson  │ Luis      │ Rojas        │ Chile          │
│ 5.94  │ Steve     │ Johnson  │ Luis      │ Rojas        │ Chile          │
│ 0.99  │ Steve     │ Johnson  │ Luis      │ Rojas        │ Chile          │
└───────┴───────────┴──────────┴───────────┴──────────────┴────────────────┘
**/

--¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?

--Consulta:
select count(InvoiceId) as ventas_totales from invoices where InvoiceDate REGEXP '^2009';

select count(InvoiceId) as ventas_totales from invoices where InvoiceDate REGEXP '^2011';

/**
2009
┌────────────────┐
│ ventas_totales │
├────────────────┤
│ 83             │
└────────────────┘

2011
┌────────────────┐
│ ventas_totales │
├────────────────┤
│ 83             │
└────────────────┘

**/

--Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para el ID de factura 37.

--Consulta:
select COUNT(*) as NumItems from InvoiceLine il JOIN Invoice i ON il.InvoiceId = i.InvoiceId WHERE i.InvoiceId = 37;
select COUNT(*) as NumItems from InvoiceLine WHERE InvoiceId = 37;

/**

**/

--Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para cada Factura. PISTA: GROUP BY

--Consulta:
select i.InvoiceId, COUNT(*) as NumItems from InvoiceLine il JOIN Invoice i ON il.InvoiceId = i.InvoiceIdGROUP BY i.InvoiceId;
select InvoiceId, COUNT(*) as NumItems from InvoiceLine GROUP BY InvoiceId;

/**

**/

--Proporciona una consulta que incluya el nombre de la pista con cada ítem de línea de factura.

--Consulta:
select il.*, t.Name as TrackName from InvoiceLine il JOIN Track t ON il.TrackId = t.TrackId;
select InvoiceLine.*, Track.Name as TrackName from InvoiceLine, Track WHERE InvoiceLine.TrackId = Track.TrackId;

/**

**/

--Proporciona una consulta que incluya el nombre de la pista comprada Y el nombre del artista con cada ítem de línea de factura.

--Consulta:
select il.*, t.Name as TrackName, ar.Name as ArtistName from InvoiceLine il JOIN Track t ON il.TrackId = t.TrackId JOIN Album al ON t.AlbumId = al.AlbumId JOIN Artist ar ON al.ArtistId = ar.ArtistId;
select InvoiceLine.*, Track.Name as TrackName, Artist.Name as ArtistName from InvoiceLine, Track, Album, Artist WHERE InvoiceLine.TrackId = Track.TrackId AND Track.AlbumId = Album.AlbumId AND Album.ArtistId = Artist.ArtistId;

/**

**/

--Proporciona una consulta que muestre el número total de pistas en cada lista de reproducción. El nombre de la lista de reproducción debe estar incluido en la tabla resultante.

--Consulta:
select pt.PlaylistId, COUNT(pt.TrackId) as TotalTracks from PlaylistTrack pt GROUP BY pt.PlaylistId;
select PlaylistTrack.PlaylistId, COUNT(PlaylistTrack.TrackId) as TotalTracks from PlaylistTrack GROUP BY PlaylistTrack.PlaylistId;

/**

**/

--Proporciona una consulta que muestre todas las pistas, pero no muestre IDs. La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.

--Consulta:
select t.Name as TrackName, al.Title as AlbumTitle, mt.Name as MediaType, g.Name as Genre from Track t JOIN Album al ON t.AlbumId = al.AlbumId JOIN MediaType mt ON t.MediaTypeId = mt.MediaTypeId JOIN Genre g ON t.GenreId = g.GenreId;
select Track.Name as TrackName, Album.Title as AlbumTitle, MediaType.Name as MediaType, Genre.Name as Genre from Track, Album, MediaType, Genre WHERE Track.AlbumId = Album.AlbumId AND Track.MediaTypeId = MediaType.MediaTypeId AND Track.GenreId = Genre.GenreId;

/**

**/

--Proporciona una consulta que muestre todas las facturas.

--Consulta:
select * from Invoice;

/**

**/

--Proporciona una consulta que muestre las ventas totales realizadas por cada agente de ventas.

--Consulta:
select e.FirstName || ' ' || e.LastName as SalesAgent, SUM(i.Total) as TotalSales from Invoice i JOIN Customer c ON i.CustomerId = c.CustomerId JOIN Employee e ON c.SupportRepId = e.EmployeeId GROUP BY e.FirstName, e.LastName;
select Employee.FirstName || ' ' || Employee.LastName as SalesAgent, SUM(Invoice.Total) as TotalSales from Invoice, Customer, Employee WHERE Invoice.CustomerId = Customer.CustomerId AND Customer.SupportRepId = Employee.EmployeeId GROUP BY Employee.FirstName, Employee.LastName;

/**

**/

--¿Qué agente de ventas realizó más ventas en 2009?

--Consulta:
select e.FirstName || ' ' || e.LastName as SalesAgent, SUM(i.Total) as TotalSales from Invoice i JOIN Customer c ON i.CustomerId = c.CustomerId JOIN Employee e ON c.SupportRepId = e.EmployeeId WHERE i.InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31' GROUP BY e.FirstName, e.LastName ORDER BY TotalSales DESC LIMIT 1;
select Employee.FirstName || ' ' || Employee.LastName as SalesAgent, SUM(Invoice.Total) as TotalSales from Invoice, Customer, Employee WHERE Invoice.CustomerId = Customer.CustomerId AND Customer.SupportRepId = Employee.EmployeeId AND Invoice.InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31' GROUP BY Employee.FirstName, Employee.LastName ORDER BY TotalSales DESC LIMIT 1;

/**

**/

--Escribir una consulta que muestre todas las playlists de la base de datos.

--Consulta:
select * from Playlist;

/**

**/

--Escribe una consulta que liste todas las canciones de una playlist.

--Consulta:

/**

**/

--Escribe una consulta que liste exclusivamente el nombre de las canciones de una playlist concreta, con el nombre de su género y el nombre de tipo de medio.

--Consulta:

/**

**/

--Por fallos con las maquinas virtuales no pude terminar la tarea ni confirmar si los selcts estan buien
