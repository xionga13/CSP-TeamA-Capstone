INSERT INTO Address (AddressId, AddressLine1, City, State, ZipCodePt1)
    VALUE
    (1, '2345 vip st', 'new york', 'NY', 44423),
    (2, '9845 Broadway Ave', 'Chicago', 'IL', 45331),
    (3, '5423 vip st', 'Duluth', 'MN', 15623),
    (4, '3212 vip st', 'Dallas', 'TX', 54128),
    (5, '6565 vip st', 'Arizona', 'AZ', 24151),
    (6, 'President Street', 'Washington', 'MD', 98213),
    (7, '77 Broadway St', 'Chicago', 'IL', 33100),
    (8, '2175 Right St', 'New Orleans', 'LA', 23322),
    (9, '3321 Main St', 'Portland', 'ME', 52824),
    (10, '45 Central Ave', 'Louisville', 'KY', 67511);

INSERT INTO Category (CategoryId, Description)
    VALUE
    (1, 'General'),
    (2, 'Home'),
    (3, 'Outdoor'),
    (4, 'Health'),
    (5, 'Education');

INSERT INTO ContactInfo (ContactInfoId, PhoneNumber, EmailAddress)
    VALUE
    (1, '743-242-5632', 'xyz@gmail.com'),
    (2, '645-487-5432', 'Allena_12@gmail.com'),
    (3, '453-555-1642', 'Eric65@gmail.com'),
    (4, '332-231-5241', 'Dalen98@gmail.com'),
    (5, '433-142-6942', 'Vishal@gmail.com'),
    (6, '743-242-3132', 'www@gmail.com'),
    (7, '645-487-5318', 'el@gmail.com'),
    (8, '453-245-0943', 'kelly@gmail.com'),
    (9, '332-321-5432', 'david@gmail.com'),
    (10, '531-132-6332', 'jeter@gmail.com');


INSERT INTO Person (PersonId, FirstName, MiddleName, LastName, JobTitle, Password, AddressId, ContactInfo)
    VALUE
    (1, 'Ellen', 'Unknown','Page', 'Actor', '1234', 1, 'Contact information'),
    (2, 'Eric', 'Middle','Last', 'Doctor', '1234', 2, 'Contact information'),
    (3, 'John', 'optional','Anderson', 'Teacher', '1234', 3, 'Contact information'),
    (4, 'Tammy', 'Unknown', 'Johnson', 'Sales Associate', '1234', 4, 'Contact information'),
    (5, 'Smith', 'Middle', 'Spencer', 'Manager', '1234', 5, 'Contact information'),
    (6, 'Alex', 'Unknown','butler', 'Vendor 1', '1234', 1, 'Contact information'),
    (7, 'El', 'Middle','perry', 'Vendor 2', '1234', 2, 'Contact information'),
    (8, 'Kelly', 'ABC','Vendor', 'Teacher', '1234', 3, 'Contact information'),
    (9, 'David', 'WWW', 'Peterson', 'Vendor 3', '1234', 4, 'Contact information'),
    (10, 'Dreak', 'Middle', 'Jeter', 'Supervisor', '1234', 5, 'Contact information');

INSERT INTO ShippingStatus (ShippingStatusId, Description)
    VALUE
    (1, 'This is just dummy text'),
    (2, 'Shipping Status Description'),
    (3, '!!!!!!!!!'),
    (4, 'Hello World'),
    (5, 'October 5 2020');

INSERT INTO PaymentType (PaymentTypeId, Description)
    VALUE
    (1, 'Credit/Debit Card'),
    (2, 'PayPal');

INSERT INTO Customers (CustomerId, PersonId)
    VALUE
    (1,1),
    (2,3),
    (3,3),
    (4,4),
    (5,5);

INSERT INTO Employee (EmployeeID, PersonId, AdminFlag)
    VALUE
    (1, 1, 0),
    (2, 2, 1),
    (3, 3, 1),
    (4, 4, 0),
    (5, 5, 0);

INSERT INTO Product (ProductId, VendorId, Name, Description, CategoryId, Quantity, ActiveFlag)
    VALUE
    (1, 1, 'Lays', 'Potato Chips', 1, 300, 1 ),
    (2, 2, 'Coffee Table', 'Home coffee table', 2, 15, 1 ),
    (3, 3, 'Backpack', 'Outdoor Backpacks for traveling', 3, 80, 1),
    (4, 4, 'Colgate', 'Famous Toothpaste!', 4, 3000, 1),
    (5, 5, 'Math Books', 'Books for college', 5, 0, 0);

INSERT INTO Price (PriceId, ProductId, Amount, EffectiveDate, ExpirationDate)
    VALUE
    (1, 1, 2.99, '2019-09-01 00:00:00', '2020-07-08 00:00:00'),
    (2, 2, 250, '2018-09-01 00:00:00', NULL ),
    (3, 3, 135, '2019-07-31 00:00:00', NULL),
    (4, 4, 4.49, '2018-07-01 00:00:00', '2020-07-08 00:00:00'),
    (5, 5, 75, '2012-09-01 00:00:00', NULL );

INSERT INTO ProductOrder (ProductOrderId, TransactionDatetime, CustomerId, ShippingStatusId, ShippingAddressId)
    VALUE
    (1, '2019-09-01 00:00:00', 1, 1, 1),
    (2, '2019-09-01 00:00:00', 2, 2, 2),
    (3, '2019-09-01 00:00:00', 3, 3, 3),
    (4, '2019-09-01 00:00:00', 4, 4, 4),
    (5, '2019-09-01 00:00:00', 5, 5, 5);

INSERT  INTO OrderItem (OrderItemId, ProductId, ProductOrderId, Quantity, TransactionPrice)
    VALUE
    (1, 1, 1, 10, 35),
    (2, 2, 3, 1, 280),
    (3, 3, 3, 1, 145),
    (4, 4, 4, 3, 17.45),
    (5, 5, 5, 4, 320);

INSERT INTO Payment (PaymentId, OrderId, Amount, TransactionDatetime, PaymentTypeId, BillingAddressId)
    VALUE
    (1, 1, 35, '2019-09-01 00:00:00', 1, 1),
    (2, 2, 280, '2019-09-01 00:00:00', 1, 1),
    (3, 3, 145, '2019-09-01 00:00:00', 2, 1),
    (4, 4, 18, '2019-09-01 00:00:00', 1, 1),
    (5, 5, 320, '2019-09-01 00:00:00', 2, 1);

INSERT INTO Message (MessageId, MessageToken, CustomerID, EmployeeId, MessageText)
    VALUE
    (1, 1, 1, 1, 'Message data'),
    (2, 2, 2, 2, 'Message test for Eric'),
    (3, 3, 3, 3, 'PHP/MYSql Message'),
    (4, 4, 4, 4, 'Dummy text'),
    (5, 5, 5, 5, 'Message token');

INSERT INTO Vendor (VendorID, CompanyName, AddressId, ContactInfoId)
    VALUE
    (1, 'XYZ Company LTD', 6, 6),
    (2, 'NewMark Company', 7, 7),
    (3, 'ABC Company', 8, 8),
    (4, 'NoSure Ltd', 9, 9),
    (5, 'OI Store', 10, 10);